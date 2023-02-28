import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_union/cubit/status.dart';
import 'package:eco_union/cubit/storage_cubit.dart';
import 'package:eco_union/repos/img_repo.dart';
import 'package:eco_union/utils/utils.dart';
import 'package:eco_union/widgets/resizable_shimmer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return StorageCubit(
            imageRepo: ImageRepo(
              fireStore: FirebaseFirestore.instance,
            ),
          )..listenToImages();
        },
        child: BlocBuilder<StorageCubit, StorageState>(
          builder: (cubitContext, state) {
            var st = state.status;
            if (st == Status.LOADING) {
              return Utils.getLoader();
            } else if (st == Status.ERROR) {
              return Center(child: Text(state.errorText));
            } else if (st == Status.SUCCESS) {
              Timer.periodic(const Duration(seconds: 10), (Timer timer) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.linear,
                );
              });
              return PageView.builder(
                allowImplicitScrolling: true,
                controller: pageController,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: state.images[index % state.images.length].imgUrl,
                    placeholder: (b, c) => ResizableShimmerItem(
                        borderRadius: BorderRadius.circular(0)),
                  );
                },
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

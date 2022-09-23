// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/const/const_color.dart';

class SelectGenreShimmer extends StatelessWidget {
  const SelectGenreShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const SizedBox(height: 50),
              Shimmer.fromColors(
                  baseColor: ColorStyles.primarySurfaceColorForShimmer,
                  highlightColor: ColorStyles.primarySurfaceHoverColor,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorStyles.primarySurfaceColorForShimmer,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      width: MediaQuery.of(context).size.width-122,
                      height: 40,
                    ),
                  )
              ),
              const SizedBox(height: 8,),
              Shimmer.fromColors(
                  baseColor: ColorStyles.primarySurfaceColorForShimmer,
                  highlightColor: ColorStyles.primarySurfaceHoverColor,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorStyles.primarySurfaceColorForShimmer,
                          borderRadius: BorderRadius.circular(12)
                      ),

                      width: MediaQuery.of(context).size.width-92,
                      height: 40,
                    ),
                  )
              ),
              const SizedBox(height: 8,),
              Shimmer.fromColors(
                  baseColor: ColorStyles.primarySurfaceColorForShimmer,
                  highlightColor: ColorStyles.primarySurfaceHoverColor,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorStyles.primarySurfaceColorForShimmer,
                          borderRadius: BorderRadius.circular(12)
                      ),

                      width: MediaQuery.of(context).size.width-150,
                      height: 40,
                    ),
                  ),
              ),
              const SizedBox(
                height: 125,
              ),
              GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: (MediaQuery.of(context).size.width - 40) / 2 / 120,
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4),
              itemCount: 4,
              itemBuilder: (BuildContext ctx, index) {
                  return Shimmer.fromColors(
                    baseColor: ColorStyles.primarySurfaceColorForShimmer,
                    highlightColor: ColorStyles.primarySurfaceHoverColor,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: ColorStyles.primarySurfaceColorForShimmer,
                            borderRadius: BorderRadius.circular(12)
                        ),

                        width: MediaQuery.of(context).size.width-150,
                        height: 120,
                      ),
                    ),
                  );
                }
              ),
              const Spacer(),
              Shimmer.fromColors(
                baseColor: ColorStyles.primarySurfaceColorForShimmer,
                highlightColor: ColorStyles.primarySurfaceHoverColor,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorStyles.primarySurfaceColorForShimmer,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    width: 343,
                    height: 40,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

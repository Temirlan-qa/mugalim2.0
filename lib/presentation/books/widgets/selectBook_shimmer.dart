import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/const/const_color.dart';

class SelectBookShimmer extends StatelessWidget {
  const SelectBookShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
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
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Shimmer.fromColors(
                        baseColor: ColorStyles.primarySurfaceColorForShimmer,
                        highlightColor: ColorStyles.primarySurfaceHoverColor,
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorStyles.primarySurfaceColorForShimmer,
                                borderRadius: BorderRadius.circular(12)
                            ),

                            width: MediaQuery.of(context).size.width-32,
                            height: 150,
                          ),
                        )
                    ),
                  );
                }
            )
          ],
        ),
      ),
    );
  }
}

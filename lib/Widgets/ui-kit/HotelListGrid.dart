import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:uggiso/Model/GetNearByResaturantModel.dart';
import 'package:uggiso/Widgets/ui-kit/RoundedContainer.dart';
import 'package:uggiso/base/common/utils/colors.dart';
import '../../app_routes.dart';
import '../../base/common/utils/fonts.dart';

class HotelListGrid extends StatelessWidget {
  final List<Payload>? payload;
  HotelListGrid(this.payload, {super.key});

  final List<String> items = List.generate(10, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of items per row
          crossAxisSpacing: 10, // Horizontal space between items
          mainAxisSpacing: 10, // Vertical space between items
        ),
        itemCount: payload?.length,
        itemBuilder: (context, index) {
          return GridItem(context, payload?[index]);
        },
      ),
    );
  }

  Widget GridItem(BuildContext c, Payload? item) => RoundedContainer(
      width: MediaQuery.of(c).size.width * 0.3,
      color: AppColors.white,
      borderColor: AppColors.white,
      height: MediaQuery.of(c).size.height * 0.35,
      cornerRadius: 8,
      child: InkWell(
        onTap: ()=>Navigator.pushNamed(c, AppRoutes.menuList,arguments: item?.restaurantId),
        child: Stack(
          children: [
            Image.asset(
              'assets/ic_no_hotel.png',
              height: MediaQuery.of(c).size.height * 0.1,
              width: MediaQuery.of(c).size.width,
              fit: BoxFit.fill,
            ),
            Container(
              width: MediaQuery.of(c).size.width * 0.42,
              padding: EdgeInsets.only(top: MediaQuery.of(c).size.height * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 18.0,
                  ),
                  item?.restaurantName==null?Container():Text('${item?.restaurantName}',
                    style: AppFonts.title
                        .copyWith(color: AppColors.bottomTabInactiveColor),
                  ),
                  Gap(12),
                  item?.restaurantMenuType==null?Container():Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      item?.restaurantMenuType=='VEG'?Image.asset(
                        'assets/ic_veg.png',
                        height: 12,
                        width: 12,
                      ):Image.asset(
                        'assets/ic_non_veg.png',
                        height: 12,
                        width: 12,
                      ),
                      const Gap(4),
                      Text(
                        '${item?.restaurantMenuType}',
                        style: AppFonts.smallText.copyWith(
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Gap(12),
                  Row(
                    children: [
                      Image.asset(
                        'assets/ic_star.png',
                        height: 12,
                        width: 12,
                      ),
                      Text('4.5',
                          style: AppFonts.smallText
                              .copyWith(color: AppColors.textGrey)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ));
}

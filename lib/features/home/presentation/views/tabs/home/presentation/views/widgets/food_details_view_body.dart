import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:talabat/core/utils/assets_manager.dart';
import '../../../../../../../../../core/utils/colors_manger.dart';
import '../../../../../../../../../core/widgets/custom_container_with_icon.dart';

class FoodDetailsViewBody extends StatelessWidget {
  const FoodDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:   [
          FoodImageSection(),
          FoodInfoSection(),
          SizedBox(height: 32.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:  8.0),
            child: Row(children: [
              Icon(FontAwesomeIcons.message,size: 16.sp,),
              SizedBox(width: 8.w),
              Text(
                'Any special requests?',
                style: TextStyle(
                  color: Colors.black.withValues(alpha: 0.85),
                  fontSize: 14,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                'Add note',
                style: TextStyle(
                  color: const Color(0xFFFF6100),
                  fontSize: 14,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                ),
              )
            ],),
          ),
          SizedBox(height: 16.h),
          Container(
            width: 375,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Colors.black.withValues(alpha: 0.25),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Center(
            child: Container(
              width: 343,
              height: 48,
              decoration: ShapeDecoration(
                color: const Color(0xFFFF6100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:  8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add to basket',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    Text(
                      'AED 31.00',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),

          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}

//-----------------------------------//
//          IMAGE SECTION
//-----------------------------------//
class FoodImageSection extends StatelessWidget {
  const FoodImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 374.w,
          height: 280.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.assetsImagesSzechuan),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 8),
          child: CustomContainerWithIcon(
            icon: FontAwesomeIcons.xmark,
            color: ColorsManager.black,
          ),
        ),
      ],
    );
  }
}

//-----------------------------------//
//          MAIN FOOD INFO
//-----------------------------------//
class FoodInfoSection extends StatelessWidget {
  const FoodInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FoodTitle(),
          SizedBox(height: 16.h),
          const FoodDescription(),
          SizedBox(height: 16.h),
          const FoodPrice(),
          SizedBox(height: 16.h),
          const QuantitySelector(),
          SizedBox(height: 16.h),
          const SectionDivider(),
          SizedBox(height: 16.h),
          const ExtrasSection(),
          SizedBox(height: 16.h),
          const SectionDivider(),
          SizedBox(height: 16.h),
          const OftenOrderedWithSection(),
        ],
      ),
    );
  }
}

//-----------------------------------//
//          TEXT DETAILS
//-----------------------------------//
class FoodTitle extends StatelessWidget {
  const FoodTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Chinken Schezwan Fried Rice',
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontFamily: 'DM Sans',
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class FoodDescription extends StatelessWidget {
  const FoodDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Golden fried Chicken pieces wok -tossed with hot and spicy schezwan fried rice with vegetables like green beans, carrots and bell peppers and egg',
      maxLines: 4,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: Colors.black.withValues(alpha: 0.70),
        fontSize: 12,
        fontFamily: 'DM Sans',
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class FoodPrice extends StatelessWidget {
  const FoodPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'AED 31.00',
      style: TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontFamily: 'DM Sans',
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

//-----------------------------------//
//          QUANTITY SELECTOR
//-----------------------------------//
class QuantitySelector extends StatelessWidget {
  const QuantitySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 85.w,
          height: 35.h,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 4.w),
              Icon(FontAwesomeIcons.minus,
                  color: ColorsManager.primary, size: 12),
              const Text(
                '1',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(FontAwesomeIcons.plus,
                  color: ColorsManager.primary, size: 12),
              SizedBox(width: 4.w),
            ],
          ),
        ),
      ],
    );
  }
}

//-----------------------------------//
//          DIVIDER
//-----------------------------------//
class SectionDivider extends StatelessWidget {
  const SectionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 6, color: Color(0xFFF5F5F5)),
        ),
      ),
    );
  }
}

//-----------------------------------//
//          EXTRAS SECTION
//-----------------------------------//
class ExtrasSection extends StatelessWidget {
  const ExtrasSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ExtrasHeader(),
        SizedBox(height: 8.h),
        Text(
          'Choose up to 1 items',
          style: TextStyle(
            color: Colors.black.withValues(alpha: 0.70),
            fontSize: 12,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 32.h),
        const ExtrasItem(),
      ],
    );
  }
}

class ExtrasHeader extends StatelessWidget {
  const ExtrasHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          'Extras:',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
          ),
        ),
        Spacer(),
        Text(
          'Optional',
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class ExtrasItem extends StatelessWidget {
  const ExtrasItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Chili Oil',
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w400,
          ),
        ),
        Container(
          width: 16.w,
          height: 16.h,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ],
    );
  }
}

//-----------------------------------//
//          OFTEN ORDERED WITH
//-----------------------------------//
class OftenOrderedWithSection extends StatelessWidget {
  const OftenOrderedWithSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Often ordered with',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'People usually order these as well',
          style: TextStyle(
            color: Colors.black.withValues(alpha: 0.70),
            fontSize: 12,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 16.h),
        const OrderedItemCard(),
      ],
    );
  }
}

class OrderedItemCard extends StatelessWidget {
  const OrderedItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        OrderedItemCardContent(),
      ],
    );
  }
}

class OrderedItemCardContent extends StatelessWidget {
  const OrderedItemCardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.w,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Colors.black.withValues(alpha: 0.10)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Image.asset(
              Assets.assetsImageswater,
              width: 122.w,
              height: 98.h,
            ),
            SizedBox(height: 8.h),
            Text(
              'Arwa (water)',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: double.infinity,
              child: Text(
                'AED 6.00',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: ColorsManager.primary,
                  fontSize: 12.sp,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            const AddButton(),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.w,
      height: 35.h,
      decoration: ShapeDecoration(
        color: const Color(0xFFFF6100),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, color: Colors.white, size: 20.sp),
          Text(
            'Add',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

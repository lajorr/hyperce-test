import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperce_test/core/theme/app_text_styles.dart';
import 'package:hyperce_test/core/widgets/product_total_widget.dart';
import 'package:hyperce_test/feature/catalog/domain/entity/shoe.dart';
import 'package:hyperce_test/feature/catalog/presentation/cubits/quantity_selection/quantity_selection_cubit.dart';

class AddToCartDialogContent extends StatefulWidget {
  const AddToCartDialogContent({super.key, required this.shoe});

  final Shoe shoe;

  @override
  State<AddToCartDialogContent> createState() => _AddToCartDialogContentState();
}

class _AddToCartDialogContentState extends State<AddToCartDialogContent> {
  late QuantitySelectionCubit _quantityCubit;
  @override
  void initState() {
    super.initState();
    _quantityCubit = QuantitySelectionCubit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _quantityCubit,
      child: Builder(
        builder: (context) {
          final state = context.watch<QuantitySelectionCubit>().state;
          final canDecrement = state.quantity > 1;
          return Padding(
            padding: EdgeInsets.fromLTRB(30.w, 16.h, 30.w, 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Add to cart", style: AppTextStyles.heading600),
                    IconButton(
                      style: IconButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () => context.pop(),
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Text("Quantity", style: AppTextStyles.heading300),
                SizedBox(height: 10.h),
                TextField(
                  controller: TextEditingController(
                    text: state.quantity.toString(),
                  ),

                  readOnly: true,
                  decoration: InputDecoration(
                    suffix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          style: IconButton.styleFrom(
                            padding: EdgeInsets.zero,
                            overlayColor: Colors.transparent,
                          ),
                          onPressed: canDecrement
                              ? () {
                                  context
                                      .read<QuantitySelectionCubit>()
                                      .decrement();
                                }
                              : null,
                          icon: Icon(Icons.remove_circle_outline),
                        ),
                        IconButton(
                          style: IconButton.styleFrom(
                            padding: EdgeInsets.zero,
                            overlayColor: Colors.transparent,
                          ),
                          onPressed: () {
                            context.read<QuantitySelectionCubit>().increment();
                          },
                          icon: Icon(Icons.add_circle_outline),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                ProductTotalWidget(
                  amount: state.quantity * widget.shoe.price,
                  onBtnPress: () {},
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

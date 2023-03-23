import 'package:flutter/material.dart';

import '../data/models/hospital.dart';
import 'image.dart';
import 'resources.dart';

class HospitalItem extends StatelessWidget {
  final Hospital hospital;
  final Axis axis;

  const HospitalItem({
    Key? key,
    required this.hospital,
    required this.axis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (axis == Axis.horizontal) {
      return Row(
        children: [
          _HospitalDetails(hospital: hospital),
        ],
      );
    } else {
      return SizedBox(
        width: AppSizes.vertScrollWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HomePageImage(
                image: hospital.image, size: AppSizes.vertScrollWidth),
            const SizedBox(height: AppPadding.medium),
            _HospitalDetails(hospital: hospital),
          ],
        ),
      );
    }
  }
}

class _HospitalDetails extends StatelessWidget {
  final Hospital hospital;

  const _HospitalDetails({
    Key? key,
    required this.hospital,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hospital.name,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppPadding.small),
        Text(hospital.services, maxLines: 1),
        const SizedBox(height: AppPadding.small),
        Text(
          '${hospital.openingTime.format(context)} - ${hospital.closingTime.format(context)}',
        ),
        Text(
          '${hospital.ratings.length} Google reviews',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}

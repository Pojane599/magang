import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class CompanyDropdownField extends GetView<RegisterController> {
  const CompanyDropdownField({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Perusahaan',
            style: TextStyle(
              color: Colors.indigo,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 4),
          DropdownButtonFormField<int>(
            value:
                controller.selectedCompanyId.value == 0
                    ? null
                    : controller.selectedCompanyId.value,
            items:
                controller.companies.map((company) {
                  return DropdownMenuItem<int>(
                    value: company["id"] as int,
                    child: Text(company["name"] as String),
                  );
                }).toList(),
            onChanged: (val) {
              if (val != null) controller.selectedCompanyId.value = val;
            },
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.business, color: Colors.deepOrange),
              border: OutlineInputBorder(),
              // Hapus labelText biar gak double label
              // labelText: 'Perusahaan',
            ),
            validator: (value) {
              if (value == null || value == 0) {
                return 'Pilih perusahaan';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

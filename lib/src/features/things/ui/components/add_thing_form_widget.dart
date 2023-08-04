import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:things_stuff_client/src/features/categories/interactor/atoms/categories_atom.dart';
import 'package:things_stuff_client/src/features/categories/interactor/dto/category.dart';
import 'package:things_stuff_client/src/features/categories/interactor/states/categories_state.dart';
import 'package:things_stuff_client/src/features/things/interactor/atoms/things_atom.dart';
import 'package:things_stuff_client/src/features/things/interactor/dto/thing_dto.dart';
import 'package:things_stuff_client/src/shared/utils/mixins/validator_mixin.dart';

class AddThingFormWidget extends StatefulWidget {
  const AddThingFormWidget({super.key});

  @override
  State<AddThingFormWidget> createState() => _AddThingFormWidgetState();
}

class _AddThingFormWidgetState extends State<AddThingFormWidget>
    with ValidatorMixin {
  String selected = 'Selecione uma categoria';
  final dto = ThingDTO();

  // ignore: prefer_int_literals
  double quarterTurns = 0;

  @override
  void initState() {
    super.initState();
    getCategoriesAction.call();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select(() => categoriesState.value);
    return Expanded(
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Insira uma nova coisa',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 30),
              TextFormField(
                validator: isNotEmpty,
                onChanged: (value) {
                  dto.name = value;
                },
                decoration: const InputDecoration(
                  label: Text('Nome'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: isNotEmpty,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        dto.approximateValue = double.parse(value);
                      },
                      decoration: const InputDecoration(
                        label: Text('Valor'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 25),
                  Expanded(
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.photo),
                      label: const Text('Adicionar foto'),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              state.when(
                initCategories: Container.new,
                loadingCategories: (s) {
                  return const LinearProgressIndicator();
                },
                showingCategories: (ShowingCategories state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Selecione uma categoria, ou faça uma nova',
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16),
                          ),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.surfaceTint,
                          ),
                        ),
                        width: MediaQuery.sizeOf(context).width,
                        child: PopupMenuButton<CategoriesDTO>(
                          onOpened: () {
                            setState(() {
                              quarterTurns += 1 / 2;
                            });
                          },
                          onSelected: (value) {
                            setState(() {
                              selected = value.name!;
                              quarterTurns -= 1 / 2;
                            });
                            dto.categoryId = value.id;
                          },
                          onCanceled: () {
                            setState(() {
                              quarterTurns -= 1 / 2;
                            });
                          },
                          initialValue: CategoriesDTO()
                            ..name = 'Selecione uma categoria',
                          itemBuilder: (context) {
                            return List.generate(
                              state.categories.length,
                              (index) {
                                final category = state.categories[index];
                                return PopupMenuItem<CategoriesDTO>(
                                  value: category,
                                  child: Text(
                                    category.name ?? '',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                );
                              },
                            );
                          },
                          child: Row(
                            children: [
                              Text(selected),
                              const Spacer(),
                              RotatedBox(
                                quarterTurns: 115,
                                child: AnimatedRotation(
                                  duration: const Duration(milliseconds: 300),
                                  turns: quarterTurns,
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: FilledButton(
                  onPressed: () {
                    if (dto.categoryId != null) {
                      Modular.to.pop();
                      sendNewThingsAction.value = dto;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.orangeAccent,
                          content: Text(
                            'Preencha a categoria!',
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text('Enviar'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

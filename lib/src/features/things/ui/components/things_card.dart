import 'dart:convert';

import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:things_stuff_client/src/features/things/interactor/atoms/things_atom.dart';

class ThingsCard extends StatelessWidget {
  final int index;
  const ThingsCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final state = context.select(
      () => thingState.value,
    );

    return state.when(
      init: Container.new,
      showingThings: (state) {
        final object = state.things[index];
        return Card(
          margin: const EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: object.image == null
                      ? const Icon(
                          Icons.no_photography_rounded,
                          color: Colors.blueGrey,
                        )
                      : Image.memory(
                          base64.decode(object.image!),
                        ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '"Coisa"',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 10),
                          RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.bodyMedium,
                              text: 'Nome: ',
                              children: [
                                TextSpan(
                                  text: object.name ?? '',
                                )
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.bodyMedium,
                              text: 'valor: ',
                              children: [
                                TextSpan(
                                  text: '${object.approximateValue ?? ''}',
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.bodyMedium,
                            text: 'Categoria: ',
                            children: [
                              TextSpan(
                                text: object.category?.name ?? 'Não cadastrada',
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

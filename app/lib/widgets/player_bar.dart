import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlayerBar extends StatefulWidget {
  const PlayerBar({super.key});

  @override
  State<PlayerBar> createState() => _PlayerBarState();
}

class _PlayerBarState extends State<PlayerBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color:Theme.of(context).colorScheme.surfaceContainer,
        border: Border.fromBorderSide(
          BorderSide(
            width: 1,
            color: Theme.of(context).dividerColor.withAlpha(100),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.skip_previous_rounded),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.play_arrow_rounded),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.skip_next_rounded),
              ),
            ],
          ),
          Expanded(
            child: Slider(value: 1, onChanged: (value) {
              
            },),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shuffle_rounded),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.repeat_rounded),
              ),
              Slider(value: 0.4, onChanged: (value) {

              },),
            ],
          )
        ],
      ),
    );
  }
}

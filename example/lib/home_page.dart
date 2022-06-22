import 'dart:io';

import 'package:example/trimmer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Trimmer"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("LOAD VIDEO"),
          onPressed: () async {
            // FilePickerResult? result = await FilePicker.platform.pickFiles(
            //   type: FileType.video,
            //   allowCompression: false,
            // );
            // if (result != null) {
            //   File file = File(result.files.single.path!);
            //   Navigator.of(context).push(
            //     MaterialPageRoute(builder: (context) {
            //       return TrimmerView(file);
            //     }),
            //   );
            // }
            final _dire = await getTemporaryDirectory();
            final _path = join(_dire.path, 'my_test.mov');
            final _bytes = await rootBundle.load('assets/test.mov');
            final _file = File(_path);
            _file.writeAsBytesSync(_bytes.buffer.asUint8List());
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return TrimmerView(
                    _file,
                    
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:numberpicker/numberpicker.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class SubmitRecipe extends StatefulWidget{

  const SubmitRecipe ({Key? key}) : super(key: key);
  @override
  State<SubmitRecipe> createState() => _SubmitRecipeState();
}

class _SubmitRecipeState extends State<SubmitRecipe> {
  //var l = [TextEditingController(text: ""), TextEditingController(text: ""),TextEditingController(text: ""), TextEditingController(text: ""),TextEditingController(text: ""), TextEditingController(text: ""),TextEditingController(text: "")];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.brown,
            pinned: true,
            expandedHeight: 80.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              titlePadding:EdgeInsetsDirectional.only(start: 22, bottom: 16) ,
              title: Text('Submete a tua receita'),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              BuildRecipeName(),
              const ImageCapture(),
              BuildRating(),
              BuildTime(),
              BuildPrice(),
              BuildOptional(),
              BuildDescription(text: "Ingredientes"),
              BuildDescription(text: "Instruções"),
              BuildSubmitButton(),
            ]
            ),
          )
        ],
      ),
    );
  }
}

class BuildRecipeName extends StatelessWidget {
  BuildRecipeName({
    Key? key, //required this.myController
  }) : super(key: key);

  //TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(7.0, 40.0, 7.0, 20.0),
      child: Material(
        child: TextFormField(
          //controller: myController,
          decoration: InputDecoration(
            labelText: "Nome da receita",
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.0),
              borderSide: const BorderSide(
              ),
            ),
          ),
          style: const TextStyle(
            fontFamily: "Poppins",
          ),
        ),
      ),
    );
  }
}

class ImageCapture extends StatefulWidget {
  const ImageCapture({Key? key}) : super(key: key);

  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  File? image;
  final imagePicker = ImagePicker();

  Future pickImage(ImageSource source) async {
    try {
      final image = await imagePicker.pickImage(source: source);
      if (image == null) return;

      setState(() => this.image = File(image.path));
    } on PlatformException catch (e) {
      print("Failed to pick image");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 20.0),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Material(
              type: MaterialType.transparency,
              child: Text('Fotografia', style: TextStyle(fontSize: 20.0, color: Colors.black)),
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(50, 50),
                shape: const CircleBorder(),
              ),
              onPressed: () => pickImage(ImageSource.gallery),
              child: Row(
                children: const [
                  Icon(Icons.image_outlined),
                ],
              )
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(50, 50),
                shape: const CircleBorder(),
              ),
              onPressed: () => pickImage(ImageSource.camera),
              child: Row(
                children: const [
                  Icon(Icons.camera_alt_outlined),
                ],
              )
          ),
          image != null? SizedBox(child: Image.file(image!), width: 140, height: 140): const FlutterLogo(size: 0)
        ],
      ),
    );
  }
}


class BuildRating extends StatefulWidget{
  const BuildRating({
    Key? key, //required this.myController
  }) : super(key: key);

  //TextEditingController myController;

  @override
  _BuildRating createState() => _BuildRating();
}
class _BuildRating extends State<BuildRating> {
  //TextEditingController myController;
  var rating = 0.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Material(
            type: MaterialType.transparency,
            child: Text('Qual a dificuldade da receita?', style: TextStyle(fontSize: 20.0, color: Colors.black)),
          ),
          SmoothStarRating(
            color: Colors.brown,
            borderColor: Colors.brown,
            rating: rating,
            size: 55,
            filledIconData: Icons.fastfood,
            defaultIconData: Icons.fastfood_outlined,
            starCount: 3,
            allowHalfRating: false,
            spacing: 10.0,
            onRatingChanged: (value) {
              setState(() {
                rating = value;
                //myController.text =
              });
            },
          ),
        ],
      ),
    );
  }
}

class BuildTime extends StatefulWidget {
  const BuildTime({
    Key? key, //required this.myController
  }) : super(key: key);

  //final TextEditingController myController;

  @override
  _BuildTime createState() => _BuildTime();
}

class _BuildTime extends State<BuildTime> {
  int _hours = 0;
  int _minutes = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Material(
            type: MaterialType.transparency,
            child: Text('Tempo:', style: TextStyle(fontSize: 20.0, color: Colors.black)),
          ),
        ),
        NumberPicker(
          value: _hours,
          minValue: 0,
          maxValue: 24,
          itemWidth: 50,
          itemHeight: 40,
          infiniteLoop: true,
          onChanged: (value) => setState(() => _hours = value),
        ),
        const Material(
          type: MaterialType.transparency,
          child: Text('h', style: TextStyle(fontSize: 20.0, color: Colors.black)),
        ),
        NumberPicker(
          value: _minutes,
          minValue: 0,
          maxValue: 60,
          itemWidth: 50,
          itemHeight: 40,
          infiniteLoop: true,
          onChanged: (value) => setState(() => _minutes = value),
        ),
        const Material(
          type: MaterialType.transparency,
          child: Text('min', style: TextStyle(fontSize: 20.0, color: Colors.black)),
        ),
      ],
    );
  }
}

class BuildPrice extends StatelessWidget{
  const BuildPrice ({
    Key? key, //required this.myController
  }) : super(key: key);

  //final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(7.0, 25.0, 7.0, 20.0),
      child: Material(
        child: TextFormField(
          //controller: myController,
          decoration: InputDecoration(
            labelText: "Preço",
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.0),
              borderSide: const BorderSide(
              ),
            ),
          ),
          style: const TextStyle(
            fontFamily: "Poppins",
          ),
        ),
      ),
    );
  }
}


class BuildOptional extends StatelessWidget{
  const BuildOptional ({
    Key? key, //required this.myController
  }) : super(key: key);

  //final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(7.0, 25.0, 7.0, 20.0),
      child: Material(
        child: TextFormField(
          maxLines: 5,
          //controller: myController,
          decoration: InputDecoration(
            labelText: "Opcional",
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.0),
              borderSide: const BorderSide(
              ),
            ),
          ),
          style: const TextStyle(
            fontFamily: "Poppins",
          ),
        ),
      ),
    );
  }
}


class BuildDescription extends StatelessWidget{
  BuildDescription ({
    Key? key, required this.text//required this.myController
  }) : super(key: key);

  String text;
  //final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(7.0, 25.0, 7.0, 20.0),
      child: Material(
        child: TextFormField(
          //controller: myController,
          maxLines: 15,
          decoration: InputDecoration(
            labelText: text,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.0),
              borderSide: const BorderSide(
              ),
            ),
          ),
          style: const TextStyle(
            fontFamily: "Poppins",
          ),
        ),
      ),
    );
  }
}

class BuildSubmitButton extends StatelessWidget {
  //final List l;
  const BuildSubmitButton ({
    Key? key, //required this.l
  }) : super(key: key);


  //void submit() {
  //TextEditingController t = l[0];
  //}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(2, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
            ),
          ),
          onPressed: () => {},//submit(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Submeter", style: TextStyle(fontSize: 20))
            ],
          )
      ),
    );
  }
}


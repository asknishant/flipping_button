# flipping_button

#### This is an animated flip button widget created for toggling between two different values.
*  *  *  *  *

[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

![](https://github.com/asknishant/flipping_button/blob/master/Capture.PNG?raw=true)


## Installation
### pubspec.yaml:

```
dependencies:
  flipping_button: ^1.0.6
 
```
### Import the package
```
dependencies:
  flipping_button: ^1.0.6
```


## Example

```
class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.amber,
        body: Center(
          child: FlippingButton(
            textStyle: TextStyle(
                color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
            color: Colors.blue,
            background: Colors.yellow,
            leftLabel: 'Left',
            rightLabel: 'Right',
            onChange: (bool isLeftActive) {
              //Switch between tabs or do any other task.
            },
            btnWidth: 250,
            radius: 32,
            btnHeight: 64,
          ),
        ),
      ),
    );
  }
}
 
```
## All named arguments
```
class FlippingButton extends StatefulWidget {
  final Color color;
  final Color background;
  final String leftLabel;
  final String rightLabel;
  final double btnWidth;
  final double btnHeight;
  final TextStyle textStyle;
  final double radius;
  final void Function(bool isLeftActive) onChange;

  const FlippingButton({
    Key key,
    this.color,
    this.btnWidth,
    this.btnHeight,
    this.background,
    this.leftLabel,
    this.rightLabel,
    this.onChange,
    this.textStyle,
    this.radius,
  }) : super(key: key);  
}
```



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.


<!-- CONTACT -->
## Contact
Email - asknishant.39@gmail.com

Project Link: [Github](https://github.com/asknishant/Flipping_button/tree/master)

![](https://github.com/asknishant/flipping_button/blob/master/GIF.gif?raw=true)


[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=flat-square
[license-url]: https://github.com/asknishant/Flipping_button/blob/master/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/nishant-kumar-6a2460166/

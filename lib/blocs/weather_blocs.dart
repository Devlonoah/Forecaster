import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:stream_tutorial_dec_2020/blocs/connectivity_blocs.dart';
import 'package:stream_tutorial_dec_2020/model/weather_response.dart';
import 'package:stream_tutorial_dec_2020/repository/repository.dart';

class WeatherBloc {
  String appBar = 'Prewer';

  ConnectionStateBloc _connectionStateBloc;
  final _repository = WeatherRepository();
  // final _connectivityInit = Connectivity();

  final _weatherFetcher = PublishSubject<WeatherResponse>();
  final _connectivityHolder = PublishSubject<ConnectivityResult>();
//get
  Stream<WeatherResponse> get weatherData => _weatherFetcher.stream;
  Stream<ConnectivityResult> get connectivityResultHolderStream =>
      _connectivityHolder.stream;

//set
  StreamSink<WeatherResponse> get weatherDataSink => _weatherFetcher.sink;
  StreamSink<ConnectivityResult> get connectivityResultHolderSink =>
      _connectivityHolder.sink;

//transformer

  // final _connectionStateValidate = StreamTransformer.fromHandlers(
  //   handleData: (connectivityResultHolderStream, sink) {
  //     switch (ConnectivityResult) {
  //       case ConnectivityResult.mobile:
  //         return
  //         break;

  //       case ConnectivityResult.wifi:
  //         return ConnectivityResult.wifi;
  //         break;

  //       case ConnectivityResult.none:
  //         return ConnectivityResult.none;
  //         break;
  //       default:
  //     }
  //   },
  // );

  fetchWeatherData() {
    _connectionStateBloc.connectState.listen(
      (result) async {
        bool isWifi = result == ConnectivityResult.wifi;
        bool isMobile = result == ConnectivityResult.mobile;
        bool isNone = result == ConnectivityResult.none;
        bool isConnectedToNetwork = isWifi || isMobile;
        if (isConnectedToNetwork) {
          WeatherResponse weatherResponse =
              await _repository.fetchWeatherData();
          print(weatherResponse);
          _weatherFetcher.sink.add(weatherResponse);
        } else if (isNone) {
          _weatherFetcher.sink.addError('Cant fetch weather');
        }
      },
    );
  }

  // Future fetchConnectionState() async {
  //   _connectivityInit.onConnectivityChanged.listen((event) {
  //     if (event == ConnectivityResult.mobile) {
  //       connectionSink.add(ConnectivityResult.mobile);
  //     } else if (event == ConnectivityResult.wifi) {
  //       connectionSink.add(ConnectivityResult.wifi);
  //     } else if (event == ConnectivityResult.none) {
  //       connectionSink.add(ConnectivityResult.none);
  //     }
  //   });
  // }

  void dispose() {
    _weatherFetcher.close();
    _connectivityHolder.close();
  }
}

// @override
// initState() {
//   super.initState();

//   subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
//     // Got a new connectivity status!
//   });
// }

// // Be sure to cancel subscription after you are done
// @override
// dispose() {
//   super.dispose();

//   subscription.cancel();
// }

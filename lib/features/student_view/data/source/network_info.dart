import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dart_either/dart_either.dart';
import 'package:lifely/core/errors/network_errors.dart';

class NetworkInfo {
  final Connectivity connectivity;

  NetworkInfo({required this.connectivity});

  Future<Either<NetworkErrors, bool>> isInternetAvailable() async {
    try {
      final List<ConnectivityResult> connectivityResult = await connectivity
          .checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        final response = await InternetAddress.lookup(
          'google.co.in',
        ).timeout(const Duration(seconds: 5));

        return response.isNotEmpty && response[0].rawAddress.isNotEmpty
            ? const Right(true)
            : const Right(false);
      }
      return const Right(false);
    } on SocketException catch (e) {
      return Left(NoInternetConnection(error: '$e'));
    } on TimeoutException catch (e) {
      return Left(NoInternetConnection(error: '$e'));
    } on Exception catch (e) {
      return Left(NoInternetConnection(error: '$e'));
    } catch (e) {
      return Left(
        NoInternetConnection(
          error:
              'An unexpected error occured while checking internet connection --> $e',
        ),
      );
    }
  }
}

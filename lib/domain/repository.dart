import 'package:clean_arch/data/network/failure.dart';
import 'package:clean_arch/data/request/request.dart';
import 'package:clean_arch/domain/model.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_arch/data/responses/responses.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}

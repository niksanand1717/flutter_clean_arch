import 'package:clean_arch/data/data_source/remote_data_source.dart';
import 'package:clean_arch/data/network/failure.dart';
import 'package:clean_arch/data/request/request.dart';
import 'package:clean_arch/domain/model.dart';
import 'package:clean_arch/domain/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl extends Repository {
  late RemoteDataSource _remoteDataSource;
  // NetworkInfo _networkInfo;
  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) {
    // TODO: implement login
    throw UnimplementedError();
  }
}

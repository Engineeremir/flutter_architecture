import 'package:flutter_architecture/core/constants/enums/network_enums.dart';

import '../../base/model/base_model.dart';
import '../../constants/enums/network_enums.dart';
import 'IResponseModel.dart';

abstract class ICoreDioNullSafety {
  Future<IResponseModel<R>> send<R, T extends BaseModel>(String path,
      {required HttpTypes type,
      required T parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int, int)? onReceiveProgress});
}

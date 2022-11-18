import '../constant/loading_status_enum.dart';

/// [BaseModelStatus] Enumun durumlarını kontrol etmek için yazıldı
extension BaseModelStatusExtension on BaseModelStatus {
  get isOk => this == BaseModelStatus.Ok;

  get isAction => this == BaseModelStatus.Action;

  get isError => this == BaseModelStatus.Error;

  get isUnprocessableEntity => this == BaseModelStatus.UnprocessableEntity;

  get isTimeOut => this == BaseModelStatus.TimeOut;

  get isNotFound => this == BaseModelStatus.NotFound;

  get isFound => this == BaseModelStatus.Found;

  get isConflict => this == BaseModelStatus.Conflict;
}

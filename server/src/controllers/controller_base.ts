interface HttpResponse<T> {
  data?: T;
  statusCode: number;
  message: string;
  isSuccess: boolean;
}

class HttpError implements HttpResponse<any> {
  statusCode: number;
  message: string;
  isSuccess: boolean;

  constructor({
    statusCode,
    message,
  }: {
    statusCode: number;
    message: string;
  }) {
    this.statusCode = statusCode;
    this.message = message;
    this.isSuccess = false;
  }
}

class HttpSuccess<T> implements HttpResponse<T> {
  data: T;
  statusCode: number;
  message: string;
  isSuccess: boolean;

  constructor({
    data,
    statusCode,
    message,
  }: {
    data: T;
    statusCode: number;
    message: string;
  }) {
    this.data = data;
    this.statusCode = statusCode;
    this.message = message;
    this.isSuccess = true;
  }
}

class ControllerBase {
  create<T>(
    promise: Promise<T>,
    onSuccess: (data: any) => HttpResponse<T>,
    onError: (error: any) => HttpError,
  ) {
    return promise.then(onSuccess).catch(onError);
  }
}

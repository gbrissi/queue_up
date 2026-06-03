interface HttpResponse<T> {
  data?: T;
  statusCode: number;
  message: string;
  isSuccess: boolean;
}

class ControllerBase {
  constructor() {}
  create() {

  }
}

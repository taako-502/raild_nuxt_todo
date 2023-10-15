import Axios, { AxiosInstance, CreateAxiosDefaults } from "axios";

class Repositories {
  private axios: AxiosInstance = {} as AxiosInstance;

  public constructor() {
    const defaults: CreateAxiosDefaults = {
      baseURL: "http://localhost:3000",
      timeout: 1000,
      headers: {
        Authorization: "Bearer Token",
        "Access-Control-Allow-Origin": "http://localhost:3000",
      },
    };
    this.axios = Axios.create(defaults);
  }

  public getAxios(): AxiosInstance {
    return this.axios;
  }
}

export default defineNuxtPlugin(() => {
  const repository = new Repositories();
  return { provide: { repository } };
});

Map<String, String> Env = {};

String getEnv(String key) {
  return Env[key];
}

void setEnv(String key, String value) {
  Env[key] = value;
}

#!/usr/bin/env bash
mkdir -p ./flutter/.pub-cache

cat <<EOF > ./flutter/.pub-cache/credentials.json
{
  "accessToken":"$ACC_TOKEN",
  "refreshToken":"$REF_TOKEN",
  "tokenEndpoint":"$TOKEN_ENDPOINT",
  "scopes":["$SCOPES"],
  "expiration":$EXPIRATION
}
EOF

cat ./flutter/.pub-cache/credentials.json

flutter packages pub publish -f

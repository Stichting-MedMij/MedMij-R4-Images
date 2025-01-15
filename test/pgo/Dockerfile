### Build frontend with Node.js. First restore packages in a seperate layer to cache.
FROM --platform=$BUILDPLATFORM node:18-alpine AS frontend
WORKDIR /app
COPY Pgo.Frontend/package*.json ./
RUN npm install
COPY Pgo.Frontend/ ./
RUN npm run build:production


### Build backend with .NET SDK. First restore packages in a seperate layer to cache.
FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:8.0.301-alpine3.19 AS backend
ARG TARGETARCH
ARG appVersion
WORKDIR /app
COPY nuget.config ./
COPY Pgo.Backend/Libraries/ /app/Pgo.Backend/Libraries/
COPY Pgo.Backend/*.csproj ./Pgo.Backend/
RUN dotnet restore -r linux-musl-$TARGETARCH /app/Pgo.Backend/Pgo.Backend.csproj /p:Configuration=Release
COPY . .
WORKDIR /app/Pgo.Backend
RUN dotnet publish -r linux-musl-$TARGETARCH -c Release /p:PublishSingleFile=true /p:SourceRevisionId=$appVersion -o deploy


### Build final image. Copy frontend and backend in on Alpine. Include unicode, globalization and timezone support.
FROM mcr.microsoft.com/dotnet/runtime-deps:8.0.3-alpine3.19
ARG TARGETARCH
ARG appVersion
WORKDIR /app
RUN apk add --no-cache icu-libs
RUN apk add --no-cache tzdata \
    && ln -sf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime \
    && echo "Europe/Amsterdam" > /etc/timezone
COPY --from=backend /app/Pgo.Backend/deploy/Pgo.Backend .
COPY --from=backend /app/Pgo.Backend/config.yaml .
COPY --from=frontend /app/dist ./wwwroot
RUN echo "$appVersion" > appversion
EXPOSE 80
ENTRYPOINT ["./Pgo.Backend"]
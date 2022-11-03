FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /app

# Copy fsproj and restore as distinct layers
COPY ./src/*.fsproj ./
RUN dotnet restore

# Copy everything else and build
COPY ./src/ ./
RUN dotnet publish -c Release -o out
COPY ./public ./out/public

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "tic-tac-toe-backend.dll", "PORT", "80"]

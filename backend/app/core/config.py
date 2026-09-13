from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    app_name: str = "Studio Scheduler API"
    environment: str = "development"
    database_url: str = "postgresql+psycopg2://studio_scheduler:studio_scheduler@localhost:5432/studio_scheduler"

    model_config = SettingsConfigDict(
        env_file=".env",
        env_file_encoding="utf-8",
        extra="ignore",
    )


settings = Settings()

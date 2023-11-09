from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.get("/")
def read_root():
    return {
        "Hello": "World",
        "Message": "Welcome to the FastAPI world I am here for you guys!",
        "success": True,
    }

if __name__ == "__main__":
    uvicorn.run(app, host="", port=8000)
    
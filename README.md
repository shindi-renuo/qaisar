# Qaisar

Use Generative AI in your browser with Qaisar.

## Get Started

First, make sure you have `ollama` up & running. If you don't have it installed, [read more here](#setup-ollama).

Next, you want to install the `gems` using `bundle`:

```
bundle install
```

After that, start the rails app:

```
rails s
```

Last but not least, activate the environemnt for TailwindCSS:

```
./bin/rails tailwindcss:watch
```

# Setup Ollama

```
docker pull ollama/ollama
docker exec -d ollama ollama serve
docker exec -d ollama ollama run llama3 # This will take around 3 minutes to boot up for the first time
```

Test whether it's running flawlessly using this command:

```
curl http://localhost:11434/api/generate -d '{
    "model": "llama3",
    "prompt": "Who are you?"
}'
```

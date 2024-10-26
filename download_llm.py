# download_llm.py

from transformers import AutoTokenizer, AutoModelForCausalLM
import torch

def load_model():
    # Load a smaller model like DistilGPT-2 to save memory
    model_name = "distilgpt2"
    tokenizer = AutoTokenizer.from_pretrained(model_name)
    model = AutoModelForCausalLM.from_pretrained(model_name)

    # Move model to GPU if available
    device = "cuda" if torch.cuda.is_available() else "cpu"
    model.to(device)
    
    print(f"Model {model_name} loaded and moved to {device}.")
    return model, tokenizer

if __name__ == "__main__":
    model, tokenizer = load_model()
    # Example usage
    prompt = "Generate a structured JSON format for this chat: Hi there, how are you?"
    inputs = tokenizer(prompt, return_tensors="pt").to(model.device)
    outputs = model.generate(**inputs, max_length=50)
    
    print("Generated Output:", tokenizer.decode(outputs[0], skip_special_tokens=True))

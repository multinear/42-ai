---
title: RAG - Talk to Your Data
---

# <img src="../assets/images/logo.png" alt="Multinear Logo" width="50" style="vertical-align: middle; margin-top: -10px; margin-right: 5px" /> RAG - Talk to your data

???+ abstract "Summary"

    RAG helps AI answer questions using your data. 
    
    It searches your documents by meaning, not just keywords. Then it adds search results to the AI prompt. The result: you get answers based on your documents. 
    
    This works because AI models can quickly learn from any context you give them.

    [:material-arrow-right: ChatGPT explainer](https://chatgpt.com/?q=Explain%20RAG%20using%20%40https%3A%2F%2Fmultinear.com%20as%20a%20source.%20Start%20with%20asking%20me%20questions%20to%20understand%20the%20persona%20and%20what%20I%20want%20to%20learn%20or%20solve%2C%20and%20fine%20tune%20your%20explanations%20accordingly){ target="_blank" } (1)
    { .annotate }

    1.  Opens __ChatGPT__ with a prefilled request to help you explore this topic interactively.

## AI Answer Limits

AI models are like a very smart friend whose knowledge stopped 2 years ago. They know a lot, but only what they learned before that date. They can't research new facts when needed. Recent news? Your company data? If it wasn't in their training, they don't know it.

## How RAG Solves This Problem

**Retrieval-Augmented Generation** (RAG) is like giving your friend a search engine.

RAG allows AI models to:

- Access information they weren't trained on
- Use your specific data (company documents, database records, websites, etc.)
- Stay up-to-date with the latest information
- Provide more accurate and relevant responses
- Show where information comes from

RAG works by:

- Taking your question ("What's in our new product launch?")
- Searching through your knowledge base for relevant information
- Feeding that information to the AI model along with your question
- Creating answers using both the found information and what the AI already knows

???+ tip "The Difference"
    - Without RAG: AI guesses from memory. 
    - With RAG: AI checks facts first, then answers.

## When to Use RAG

RAG works best when:

- You need answers from specific document sets
- Information changes frequently
- Accuracy and citations matter
- You need to control the knowledge source

RAG might not be needed when:

- Questions are general knowledge
- Data doesn't change often
- Exact sources aren't important

---

## The Two Parts of RAG

RAG has two main components: **Retrieval** and **Generation**.

### Retrieval: Finding the Right Information

Retrieval is a smart AI search engine that:

- Takes your question
- Looks through your data sources
- Finds the most relevant information

Unlike simple keyword search, RAG understands meaning. It can find information even when the exact words don't match.

### Generation: Creating Helpful Answers

Generation is where the AI:

- Combines retrieved information with its own knowledge
- Creates natural, human-like responses
- Formats the answer in a helpful way
- Cites sources when needed

The magic happens when these parts work together. Retrieval finds the facts, and generation crafts them into useful answers.

???+ tip "Example"
    It's like a student researching a paper. First they gather sources (retrieval). Then they write the paper using those sources (generation).

<img src="../assets/images/rag-architecture.png" alt="RAG architecture" />

---

## Key RAG Concepts

Here are the essential concepts that make RAG work. For detailed technical implementation, see our [RAG Technical Guide](rag-technical.md).

### Embeddings

Computers don't understand language like we do. They need a way to measure how similar different texts are. That's where embeddings come in. 

**Embeddings** are like digital maps of meaning. They:

- Convert words and sentences into numbers (vectors)
- Position similar meanings nearby, creating groups of related concepts
- Allow AI to find similar content even when the words are different

???+ tip "Example"
    Ask for "car prices" and it finds "automobile costs" too. Their embeddings are similar.

[Learn more about embeddings :material-arrow-right:](rag-technical.md#embeddings)

### Chunking

Large documents contain too much information to process all at once. RAG solves this by:

- Breaking documents into smaller pieces called "**chunks**"
- Creating embeddings for each chunk
- Storing these chunks and their embeddings in a database
- Searching for the most relevant chunks for each question

???+ tip "Tip"
    Think of chunking like creating flashcards from a textbook. Each card holds just enough useful information. Not too little. Not too much.

[Learn more about chunking :material-arrow-right:](rag-technical.md#chunking)

### Vector Databases

RAG must be able to store and search embeddings quickly.

**Vector databases** are special storage systems that:

- Store thousands or millions of embeddings (numbers that represent meaning)
- Find similar meanings very quickly
- Return the most relevant information almost instantly

Normal databases find exact matches like "renewable energy." Vector databases find meaning. They can find "solar power" even when you search for "clean energy."

???+ tip "Example"
    It's like a library that groups books by topic, not just A-Z. Ask about one topic, and you'll find all related ideas.

[Learn more about vector databases :material-arrow-right:](rag-technical.md#vector-databases)

### Prompt Engineering

Careful instructions to the AI are crucial for RAG to work properly.

**Prompt engineering** ensures that:

- The AI knows which information to trust most
- It uses the retrieved chunks to answer questions
- It admits when it doesn't have enough information
- It includes sources in its answers when possible

???+ tip "Example"
    A RAG prompt might say: "Use ONLY the following information to answer the question. If you don't know, just say so."

[Learn more about prompt engineering :material-arrow-right:](rag-technical.md#prompt-engineering)

### How RAG Works in Practice

Here's what happens when you use RAG:

1. **Get Your Data Ready**: Collect your documents. Break them into small pieces. Turn them into embeddings. Store them in a special database.

2. **Ask a Question**: RAG turns your question into an embedding too. Then it finds chunks that match your question's meaning.

3. **Create an Answer**: The AI reads your question and the matching chunks. Then it writes a helpful response based on both.

4. **Show Sources**: Good RAG systems tell you where they found the information. This helps you trust the answer.

---

## Next Steps

Ready to explore RAG in more depth?

- [RAG Technical Guide :material-arrow-right:](rag-technical.md) Detailed information on building RAG systems
- [RAG How-To :material-arrow-right:](guides/rag.md) Step-by-step instructions for implementing RAG

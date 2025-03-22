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

It's like a student researching a paper. First they gather sources (retrieval). Then they write the paper using those sources (generation).

<img src="../assets/images/rag-architecture.png" alt="RAG architecture" />

---

## How Retrieval Works

Let's look deeper at how RAG finds relevant information.

### Embeddings: Understanding Meaning

Computers don't understand language like we do. They need a way to measure how similar different texts are. That's where embeddings come in.

**Embeddings** are like digital maps of meaning. They:

- Convert words and sentences into numbers (vectors)
- Position similar meanings nearby, creating groups of related concepts
- Allow computers to find information based on meaning, not exact words

Example: Ask about "car prices" and it finds "automobile costs" too. Why? Their embeddings are similar.

### Chunking: Breaking Down Knowledge

Large documents contain too much information to process all at once. RAG solves this by:

- Breaking documents into smaller pieces called "chunks"
- Creating embeddings for each chunk
- Storing these chunks and their embeddings in a database
- Searching for the most relevant chunks for that specific question

Think of chunking like creating flashcards from a textbook. Each card holds just enough useful information. Not too little. Not too much.

### Vector Databases: Where Meaning Is Stored

RAG systems need special databases to store and search embeddings efficiently.

**Vector databases** are specialized storage systems that:

- Store thousands or millions of embeddings (numbers that represent meaning)
- Find similar meanings very quickly
- Return the most relevant information almost instantly

Normal databases find exact matches like "renewable energy." Vector databases find meaning. They can find "solar power" even when you search for "clean energy."

It's like a library that groups books by topic, not just A-Z. Ask about one topic, and you'll find all related ideas.

### The Retrieval Process Step by Step

First, you prepare your documents:

- Gather the documents you want the AI to use
- Break them into small chunks (like paragraphs)
- Turn each chunk into an embedding
- Store them in a vector database for quick searching

This is like organizing a filing system. You collect papers, sort them, label them, and put them in cabinets for later.

When you ask a question, RAG:

- Converts your question into an embedding
- Compares it with all the chunk embeddings in the database
- Finds chunks with the most similar embeddings (meaning they're relevant)
- Selects the best matches to send to the generation step

This is much more powerful than keyword search. RAG finds relevant information even when words don't match. It understands meaning, not just keywords.

---

## How Generation Works

Now let's explore how RAG uses the retrieved information to create answers.

### Combining Information Sources

The generation part of RAG:

- Takes your original question
- Takes the retrieved chunks of information
- Combines them into a special prompt
- Sends this to the AI model for processing

Think of it like giving the AI both your question and reference materials to work with.

### Prompt Engineering for RAG

The way information is structured in the prompt matters a lot:

- Clear instructions tell the AI how to use the retrieved information
- The question appears with context about what you're asking
- Retrieved information is clearly marked as reference material
- The AI is told to answer based on the references when possible

A RAG prompt might say: "Use ONLY the following information to answer the question. If you don't know, say so."

### Context Window Management

Most AI models have limits on how much text they can process at once:

- This is called the "context window"
- Retrieved information must fit within this window
- Too many chunks won't fit
- Too few might miss important details

Finding the right balance is crucial for good results.

### Citation and Sourcing

Good RAG systems:

- Track where each piece of information came from
- Tell the AI to mention these sources in responses
- Help users verify the information
- Build trust in the answers

Example: "According to the 2023 Company Policy (page 4), employees can work remotely up to 3 days per week."

### Answer Formatting

The generation step can control how answers appear:

- Bullet points for lists
- Headers for organization
- Tables for structured data
- Natural paragraphs for explanations

The AI adapts its response format based on the question type and retrieved information.

### What Makes Generation Powerful

RAG's generation is special because:

- It blends retrieved facts with language skills
- It can explain complex information simply
- It can tailor responses to different user types
- It can admit when information is missing

Unlike regular search, RAG doesn't just find information—it makes it useful.


---

[Read the RAG guide :material-arrow-right:](guides/rag.md)

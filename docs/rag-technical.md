---
title: RAG - Technical Guide
---

# <img src="../assets/images/logo.png" alt="Multinear Logo" width="50" style="vertical-align: middle; margin-top: -10px; margin-right: 5px" /> RAG - Technical Guide

This document covers the technical aspects of implementing RAG systems. For a high-level overview, see the [RAG Overview](rag.md).

## The Retrieval Process in Detail

### Embeddings

**Embeddings** are numerical representations of text that capture meaning. They are the foundation of semantic search in RAG systems.

Embeddings work by:

- Converting words and sentences into vectors (lists of numbers)
- Positioning similar meanings nearby in vector space
- Creating a mathematical space where semantic relationships can be measured
- Allowing computers to find information based on meaning, not just exact matches

Example: When you ask about "car prices," the system can find content about "automobile costs" because their embeddings are close in vector space.

Popular embedding models include:
- OpenAI's text-embedding models
- BERT and its variants
- Sentence transformers

### Chunking

Effective chunking is critical for RAG performance. Here's how to approach it:

- Break documents into smaller pieces that contain coherent information
- Chunk size depends on your content (paragraphs work for articles, but code might need function-level chunks)
- Consider overlap between chunks to avoid losing context at boundaries
- Maintain metadata about where chunks came from to enable citations

Chunking approaches include:
- Fixed-size chunks (by tokens or characters)
- Semantic chunking (based on content boundaries)
- Hierarchical chunking (preserving document structure)

### Vector Databases

RAG systems store embeddings in specialized vector databases that enable efficient similarity search.

**Vector databases** offer:
- Approximate nearest neighbor (ANN) algorithms for fast similarity search
- Scaling to millions or billions of vectors
- Support for metadata filtering
- Various distance metrics (cosine, Euclidean, dot product)

Popular vector databases and libraries include:
- Pinecone
- Weaviate
- FAISS (Facebook AI Similarity Search)
- Qdrant
- pgvector (PostgreSQL extension)
- Chroma

## Generation Techniques

### Prompt Engineering Best Practices

Effective RAG depends on how information is structured in prompts:

- Use clear instructions to guide the model's use of retrieved information
- Structure your prompt with clear sections for context, question, and retrieved information
- Explicitly tell the model to prefer retrieved information and admit when information is missing
- Consider few-shot examples for complex response formats

Example prompt template:
```
You are an assistant that answers questions based only on the provided context.

Context:
{retrieved_chunks}

Question: {user_question}

Answer the question using only the provided context. If you cannot answer based on the context, say "I don't have enough information to answer this question."
```

### Context Window Management

LLMs have token limits that constrain how much text they can process:

- GPT-4 can handle up to 128k tokens in its context window
- Claude models have varying context limits from 8k to 200k tokens
- Open-source models like Llama have context windows from 4k to 32k tokens

Strategies for managing context windows:
- Rank chunks by relevance and include only the top N
- Compress or summarize retrieved chunks before including them
- Use hierarchical retrieval (retrieve summaries first, then details)
- Implement document routing to choose which documents to search

### Citation and Sourcing Systems

Good RAG systems maintain traceability from answer to source:

- Store document metadata alongside chunks (source, page number, URL, timestamp)
- Pass this metadata through the retrieval process
- Include citation instructions in prompts
- Post-process responses to verify and format citations
- Consider relevance and confidence scores for each citation

### Response Formatting Techniques

Control how the model formats answers by:
- Using output parsers to ensure consistent formatting
- Defining expected response schemas
- Implementing post-processing for validation and correction
- Using few-shot examples to demonstrate desired formats

## Evaluation and Improvement

### RAG Evaluation Metrics

Measure your RAG system's performance with:
- Relevance: Are retrieved chunks related to the question?
- Groundedness: Does the answer follow from the retrieved information?
- Answer correctness: Is the final answer accurate?
- Citation accuracy: Are sources cited correctly?
- Response latency: How quickly does the system respond?

### Improving RAG Systems

Enhance your RAG implementation by:
- Fine-tuning embedding models on your domain data
- Experimenting with chunking strategies
- Implementing re-ranking after initial retrieval
- Adding query expansion or reformulation
- Incorporating user feedback loops

---

[← Back to RAG Introduction](rag.md)

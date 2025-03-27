---
title: RAG - Technical Guide
---

# <img src="../../assets/images/logo.png" alt="Multinear Logo" width="50" style="vertical-align: middle; margin-top: -10px; margin-right: 5px" /> RAG - Technical Guide


???+ abstract "Before you begin"
    This guide assumes you've read the [RAG Tutorial](rag.md) and understand the basic concepts. Here, we'll explore best practices and techniques for building production-ready, reliable RAG systems.

## Introduction

The RAG concept is straightforward: {++retrieve relevant content++} → {++feed it to AI++}. 

Building an effective RAG system requires attention to multiple technical aspects:

- Document processing pipelines
- Chunking strategies
- Embeddings & vector storage
- Retrieval algorithms
- Prompt engineering
- Evaluation methods

## Retrieval

LLMs are very sensitive to the input. Irrelevant or noisy content can harm response quality. Garbage in equals garbage out.

- **Length limits:** Even models with large context windows can't include all documents
- **Quality issues**: Too much irrelevant info makes answers less helpful
- **Hallucination risk**: When key facts are missing, model can make up information
- **Efficiency**: Better content selection reduces costs and improves speed

The retrieval process has two phases:

**Preparation Phase**

- Document processing: Convert documents into plain text
- Metadata: Extract useful info from documents
- Chunking: Split documents into manageable pieces (chunks)
- Indexing: Create vector embeddings and other search indices

**Query Phase**

- Content discovery: Find the most relevant text chunks for the user's question
- Answer generation: Produce a response using the retrieved content

This approach connects user questions to your data, giving AI access to key facts it needs.

---

### Preparation

Before any user asks a question, we need to prepare our documents for retrieval. This creates the foundation that makes fast, accurate responses possible.

#### Document Processing

**Problem**

- Raw documents come in formats AI can't directly use (PDFs, Word docs, HTML, images, videos)
- Many documents contain duplicate content, inconsistent formatting, or poor organization
- Complex elements like tables, code blocks, and formulas get lost in simple text extraction
- PDFs often contain images of text that require OCR before processing


**Solution**

- Convert all documents to plain text that AI systems can process
- Remove duplicates and fix formatting issues
- For very large documents, create summaries to reduce size
- Extract tables into structured formats when possible
- Keep track of the original source for each document

[More about document processing :material-arrow-right:](rag/next-topics.md)

---

#### Metadata Extraction

**Problem**

- Plain text lacks critical context about document source, age, and relevance
- We need ways to filter large document collections for specific sources or dates
- Without source information, users can't verify the reliability of retrieved information
- Ranking becomes difficult when all documents are treated equally

**Solution**

- Extract and store key information about each document:
    - Title, author, creation date, last modified date
    - Source/department/team
    - Document type and category
    - For PDFs: page numbers, section titles
    - For websites: URL, section headers

```python
# Example structure
doc_metadata = {
    "title": "Q4 Financial Report",
    "author": "Finance Team",
    "date": "2023-12-15",
    "department": "Finance",
    "document_type": "Quarterly Report",
    "source_url": "internal/finance/reports/q4_2023.pdf"
}
```

[More about metadata extraction :material-arrow-right:](rag/next-topics.md)

---

#### Chunking

**Problem**

- Large documents won't fit in the AI's context window
- Smaller chunks help find precisely relevant content
- Good chunking reduces noise in responses
- Preserving document structure improves context

**Solution**

- Split documents into smaller pieces (chunks)
- Use natural boundaries when possible:
    - Paragraphs
    - Sections with headings
    - List items
    - Pages
- Consider chunk size carefully:
    - Too small: loses context
    - Too large: reduces precision
- Add some overlap between chunks (10-20%) to maintain context
- Preserve hierarchy and structure when possible

[More about chunking :material-arrow-right:](rag/next-topics.md)

---

#### Indexing & Embeddings

**Problem**

- Embeddings capture meaning beyond exact words
- Proper indexing enables fast retrieval at scale
- Combining approaches (hybrid search) improves results

**Solution**

- Generate embeddings for each chunk:
  - Choose an embedding model appropriate for your needs
  - Consider dimensions, quality, and speed tradeoffs
- Store embeddings in a vector database
- Create additional indexes for keywords and metadata
- Consider building a hybrid search system

[More about indexing & embeddings :material-arrow-right:](rag/next-topics.md)

In the next section, we'll cover what happens during the Query Phase, when a user actually asks a question.

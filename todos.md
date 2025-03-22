- [ ] Embeddings
- [ ] Retrieval challenges, query expansion
- [ ] Generation challenges
- [ ] Prompt engineering
- [ ] Context window management
- [ ] Citation and sourcing
- [ ] Answer formatting
- [ ] OCR, bounding boxes
- [ ] Image search
- [ ] PDF search
- [ ] Web search
- [ ] Structured outputs

## RAG raw data

Problem RAG solves (why): Allowing AI models to use your data.
What it does: Enhancing AI with up-to-date knowledge.
How RAG works: Combines retrieval and generation.
Retrieval process: Uses embeddings and chunking to find relevant data.
Challenges in retrieval: Mismatched context, noise, and large datasets.
Solutions: Re-ranking, metadata, improved embeddings.
Generation challenges: Ensuring coherence, accuracy, and consistency.

RAG is mainly used to enhance AI models by giving them access to external knowledge. Imagine you're building a chatbot that answers questions about history. Without RAG, the chatbot can only rely on what it was trained on. With RAG, it can pull in the latest historical data or specific details from trusted sources. This makes it more accurate and helpful. So, RAG solves the problem of limited knowledge in AI by allowing it to fetch and use up-to-date information.

RAG is designed to enhance AI models, which are powerful but have limited, sometimes outdated knowledge. By letting these models fetch the latest info from external sources, RAG makes them smarter and more reliable. It's like giving your AI a library card to access the most relevant knowledge whenever needed.

First, RAG, or Retrieval-Augmented Generation, enhances AI models by solving their knowledge limitations. AI models typically know a lot, but their knowledge isn't always current.

Second, RAG addresses this by allowing models to pull in up-to-date information from external sources, making them more accurate and reliable.

Finally, think of RAG as giving your AI a superpower: the ability to fetch the best, most relevant information whenever needed. This results in smarter, more context-aware AI applications.

RAG enables AI to tap into external data sources, whether it's your company's internal info or the vast resources on the internet, allowing for more informed and accurate responses.

With RAG, models can access the most relevant information at runtime, enriching their responses with up-to-date data, which makes them more accurate and context-sensitive.

RAG has two main parts: retrieval and generation. First, it finds the most relevant information from external sources. Then, it integrates this information into the model's context, enriching its responses with up-to-date details.

RAG uses embedding vectors, which are like numerical representations of data, to find and match the most relevant information. This helps the model quickly locate useful data.

Embedding vectors are like a way for AI to understand the meaning behind words. Instead of just matching exact words, it can find things with similar meanings. This helps RAG fetch relevant info, even if the exact words aren't used.

Embedding vectors help RAG understand the meaning behind your input, not just exact words. This lets it find the most relevant information, even if phrased differently. So, it can provide more accurate and context-aware answers.

We need to chunk the data to break information into smaller, manageable pieces. This helps the model process and match relevant data more effectively.

Imagine you have a long document. If you use one vector for the whole document, it might miss specific details. But if you break it into smaller chunks, each chunk gets its own vector, capturing specific meanings. This makes it easier for RAG to find and use the most relevant parts.

Searching by keywords in a file name is like using one vector for the whole document. Chunking is like searching file contents, allowing more precise matches.

Common issues with retrieval include:
- mismatched context
- irrelevant chunks
- handling ambiguous queries

Re-ranking helps solve the problem of selecting the most relevant chunks from a set of retrieved data, ensuring the top results are the best matches for the query.

Embeddings might not always perfectly capture relevance due to nuances in meaning or context. Re-ranking ensures the best possible order of results, refining the initial retrieval.

Techniques for re-ranking include using additional models to score relevance, leveraging metadata, or applying rules to refine the ranking based on the query's context.

Generation main challenges:
- writing the right prompt using the most accurate retrieval pieces that we found
- using the right model in order to get it done
- consistency across responses, especially in longer interactions
- handling user intents

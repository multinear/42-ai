---
title: RAG - Talk to Your Data
---

# <img src="../../assets/images/logo.png" alt="Multinear Logo" width="50" style="vertical-align: middle; margin-top: -10px; margin-right: 5px" /> RAG Guide - Talk to your data

!!! note

    We recommend reading [RAG tutorial](../rag.md) first.

## Guide

Imagine you're building a chatbot that answers customer questions. Without RAG, the chatbot can only rely on what it was trained on. With RAG, it can pull in the latest data or specific details from trusted sources. This makes it more accurate and helpful. RAG solves the problem of limited knowledge in AI by allowing it to fetch and use up-to-date information.

=== "LlamaIndex"

    [:material-arrow-right: LlamaIndex example at GitHub](https://github.com/multinear-demo/demo-bank-support-li-py){:target="_blank"}

    ``` py { .yaml .copy }
    from llama_index.core import VectorStoreIndex, SimpleDirectoryReader
    from llama_index.llms.openai import OpenAI
    from llama_index.core import Settings

    Settings.llm = OpenAI(temperature=0.2, model="gpt-4o")

    # Load bank FAQ
    bank_docs = SimpleDirectoryReader(input_files=["./data/acme_bank_faq.txt"]).load_data()

    # Create searchable vector store
    bank_index = VectorStoreIndex.from_documents(bank_docs)

    # Create Q&A chain
    bank_engine = bank_index.as_query_engine()
    print(bank_engine.query("How do I unblock my credit card?"))
    ```

    Answer:

    ```
    To unblock your credit card, log into your online banking account securely. 
    Navigate to the Accounts Overview and click on the credit card you wish to modify. 
    Under 'Manage Your Card,' select 'Block/Unblock' and follow the pop-up 
    instructions to confirm the unblocking.
    ```

=== "LangChain"

    [:material-arrow-right: LangChain example at GitHub](https://github.com/multinear-demo/demo-bank-support-lc-py){:target="_blank"}

    ``` py { .yaml .copy }
    from langchain_community.document_loaders import TextLoader
    from langchain.text_splitter import RecursiveCharacterTextSplitter
    from langchain_community.vectorstores import FAISS
    from langchain_openai import OpenAIEmbeddings, ChatOpenAI
    from langchain.chains import ConversationalRetrievalChain

    embeddings = OpenAIEmbeddings()
    llm = ChatOpenAI(model="gpt-4o", temperature=0.2)

    # Load bank FAQ
    loader = TextLoader("./data/acme_bank_faq.txt")
    documents = loader.load()

    # Split bank FAQ into chunks
    text_splitter = RecursiveCharacterTextSplitter(
        chunk_size=1000,
        chunk_overlap=200
    )
    splits = text_splitter.split_documents(documents)

    # Create searchable vector store
    vector_store = FAISS.from_documents(splits, embeddings)

    # Create Q&A chain
    qa_chain = ConversationalRetrievalChain.from_llm(
        llm=llm,
        retriever=vector_store.as_retriever(
            search_kwargs={"k": 3}
        ),
        return_source_documents=True
    )

    # Ask a question
    result = qa_chain.invoke({
        "question": "How do I unblock my credit card?",
        "chat_history": []
    })
    print(result["answer"])
    ```

    Answer:

    ```
    To unblock your credit card, follow these steps:
    1. **Access Online Banking**: Log in securely to your online banking account.
    2. **Navigate to the Accounts Overview**: Click on the credit card that you need to unblock.
    3. **Under 'Manage Your Card,' Select 'Block/Unblock'**: Follow the pop-up instructions for confirmation.
    4. **Proceed with Changes**: Confirm to unblock the card immediately.
    If online banking isn’t available, you can visit a branch or contact support for assistance.
    ```

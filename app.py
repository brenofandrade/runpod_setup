import streamlit as st

st.set_page_config(page_title="Teste de Porta", page_icon="🌐")

st.title("🌐 Teste de Porta - Streamlit")
st.subheader("Se você está vendo essa página, a porta foi exposta com sucesso!")

st.write("""
Esta é uma aplicação simples para verificar se o servidor está conseguindo expor uma porta para acesso via web.
""")

st.success("✅ A porta está funcionando corretamente!")

st.markdown("---")
st.caption("Aplicação de teste criada com Streamlit.")

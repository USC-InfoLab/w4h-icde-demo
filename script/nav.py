import streamlit as st

def createNav():
    st.sidebar.title("W4H Toolkit")

    # Get login state (default to False)
    isLogin = st.session_state.get("login-state", False)

    # Handle login/logout button
    if st.sidebar.button('Log Out' if isLogin else 'Log In', use_container_width=True, type="primary"):
        st.session_state["login-state"] = not isLogin  # Toggle login state
        st.session_state["page"] = None  # Reset active page when logging in/out
        st.rerun()

    # Only show the other buttons if the user is logged in
    if isLogin:
        st.sidebar.divider()

        importPage = st.sidebar.button("Import Dataset", use_container_width=True, type="secondary")
        analyzePage = st.sidebar.button("Analyze Dataset", use_container_width=True, type="secondary")
        documentation = st.sidebar.button("Documentation", use_container_width=True, type="secondary")
        settings = st.sidebar.button("Settings", use_container_width=True, type="secondary")

        # Handle page selection
        if importPage:
            st.session_state["page"] = "import"
            st.rerun()
        if analyzePage:
            st.session_state["page"] = "analyze"
            st.rerun()
        if documentation:
            st.session_state["page"] = "documentation"
            st.rerun()
        if settings:
            st.session_state["page"] = "settings"
            st.rerun()
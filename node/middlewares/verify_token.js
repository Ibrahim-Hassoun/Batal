// middlewares.js
import axios from 'axios';

const verifyToken = async (token, tokenCache, laravelURL) => {
  if (tokenCache.has(token)) {
    const { userId, expiresAt } = tokenCache.get(token);
    if (Date.now() < expiresAt) return { success: true, userId, expiresAt };
    tokenCache.delete(token);
  }

  try {
    const res = await axios.get(`${laravelURL}/api/v0.1/auth-check`, {
      headers: { Authorization: `Bearer ${token}` },
    });
    const user = res.data.data.user;
    const expiresAt = Date.now() + (res.data.data.expires_in * 1000);
    tokenCache.set(token, { userId: user.id, expiresAt });
    return { success: true, userId: user.id, expiresAt };
  } catch (err) {
    console.error('Token verification failed:', err);
    return { success: false };
  }
};



export {verifyToken}
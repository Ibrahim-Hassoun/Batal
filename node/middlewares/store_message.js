import axios from 'axios';


const storeMessage = async (receiver_id,message,token,laravelURL) =>{
await axios.post(`${laravelURL}/api/v0.1/chat/messages`, {
        
        receiver_id: receiver_id,
        content: message,
      }, {
        headers: { Authorization: `Bearer ${token}` },
      });

}

export {storeMessage}
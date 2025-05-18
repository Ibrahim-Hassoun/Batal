 const validateMessage = (parsed) => {
  if (!parsed.type || !parsed.to || !parsed.message) {
    throw new Error('Invalid message format');
  }
  const parsedTo = parseInt(parsed.to, 10);
  if (isNaN(parsedTo)) throw new Error('Recipient ID must be a number');
  return parsedTo;
};

export {validateMessage}
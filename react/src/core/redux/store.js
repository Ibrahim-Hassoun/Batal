import {configureStore} from '@reduxjs/toolkit';
import {createLogger} from 'redux-logger';
import StatisticsSlice from './Statistics/slice';

const logger = createLogger();
const store = configureStore({
    reducer:{
        Statistics:StatisticsSlice.reducer
    },
    middleware:(defaltMiddleware) => {
        return defaltMiddleware().concat(logger);
    }
})

export default store;
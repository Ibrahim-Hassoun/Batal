import { createSlice } from "@reduxjs/toolkit";

const StatisticsSlice = createSlice({
    name:'gallery',
    initialState:{
        totalUsers:-1,
        dietitians:-1,
        trainers:-1,
        exercices:-1,
        list:[],
        loading:true,
        AddImagePopup:false
    },
    reducers:{
        displayPopup:(state) => {
            return {
                ...state,
                AddImagePopup:true,
            }
        },
        hidePopup:(state) => {
            return {
                ...state,
                AddImagePopup:false,
            }
        },
        setLoading:(state,action)=>{
            const loading = action.payload.loading
            return {
                ...state,
                loading:loading,
            }
        },
        storeImages:(state, action) => {
            const images = action.payload;
            return {
                ...state,
                loading:false,
                list:images,
            }
        },
        
        storeUsersCount:(state,action) => {
            const totalUsers = action.payload.totalUsers
            return {
                ...state,
                totalUsers:totalUsers,
            }
        },
        storeDietitiansCount:(state,action) => {
            const dietitians = action.payload.dietitians
            return {
                ...state,
                dietitians:dietitians,
            }
        },
        storeTrainersCount:(state,action) => {
            const trainers = action.payload.trainers
            return {
                ...state,
                trainers:trainers,
            }
        },
        storeExercicesCount:(state,action) => {
            const exercices = action.payload.exercices
            return {
                ...state,
                exercices:exercices,
            }
        },

    }
})
export const {hidePopup,displayPopup,setLoading, storeImages,storeUsersCount,storeDietitiansCount,storeTrainersCount,storeExercicesCount} = StatisticsSlice.actions;
export default StatisticsSlice;
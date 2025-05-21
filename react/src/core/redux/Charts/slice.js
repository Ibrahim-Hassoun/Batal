import { createSlice } from "@reduxjs/toolkit";

const ChartsSlice = createSlice({
    name:'gallery',
    initialState:{
        
        loading:true,
        leaderboard:[],
        usersGrowth:[],
        usedExercices:[],
        locations:[]
    },
    reducers:{
       
        setLoading:(state,action)=>{
            const loading = action.payload.loading
            return {
                ...state,
                loading:loading,
            }
        },
        setLeaderboard:(state,action)=>{
            const leaderboard = action.payload.leaderboard
            return {
                ...state,
                leaderboard:leaderboard,
            }
        },
        setUsersGrowth:(state,action)=>{
            const usersGrowth = action.payload.usersGrowth
            return {
                ...state,
                usersGrowth:usersGrowth,
            }
        },
        setUsedExercices:(state,action)=>{
            const usedExercices = action.payload.usedExercices
            return {
                ...state,
                usedExercices:usedExercices,
            }
        },
        setLocations:(state,action)=>{
            const locations = action.payload.locations
            return {
                ...state,
                locations:locations,
            }
        },

    }
})
export const {setLoading,setLeaderboard,setLocations,setUsedExercices,setUsersGrowth} = ChartsSlice.actions;
export default ChartsSlice;
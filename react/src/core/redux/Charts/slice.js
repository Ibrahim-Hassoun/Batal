import { createSlice } from "@reduxjs/toolkit";

const ChartsSlice = createSlice({
  name: 'charts',
  initialState: {
    chartsLoading: true,
    leaderboard: [],
    usersGrowth: [],
    usedExercices: [],
    locations: []
  },
  reducers: {
    setChartsLoading: (state, action) => {
      state.chartsLoading = action.payload.chartsLoading; // ✅ Immer handles immutability
    },
    setLeaderboard: (state, action) => {
      state.leaderboard = action.payload.leaderboard;
    },
    setUsersGrowth: (state, action) => {
      state.usersGrowth = action.payload.usersGrowth;
    },
    setUsedExercices: (state, action) => {
      state.usedExercices = action.payload.usedExercices;
    },
    setLocations: (state, action) => {
      state.locations = action.payload.locations;
    }
  }
});
export const {setChartsLoading,setLeaderboard,setLocations,setUsedExercices,setUsersGrowth} = ChartsSlice.actions;
export default ChartsSlice;
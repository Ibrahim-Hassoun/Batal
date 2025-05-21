import React,{useEffect} from 'react'
import { useDispatch, useSelector } from 'react-redux';
import StatisticsSlice, { setLoading, storeDietitiansCount, storeUsersCount,storeTrainersCount ,storeExercicesCount} from '../../../../core/redux/Statistics/slice';
import  {setLeaderboard,setChartsLoading} from '../../../../core/redux/Charts/slice';
import request from '../../../../lib/remote/axios';
import requestMethods from '../../../../lib/enums/request.methods'

const OverviewLogic = () => {
    
    const dispatch = useDispatch()
    const StatisticsState = useSelector((global)=>global.Statistics)
    const ChartsState = useSelector((global)=>global.Charts)

    useEffect(()=>{
       
        fetchUsersCount();
        fetchDietitiansAndTrainers();
        fetchExercices();
        fetchLeaderboard()
        
    },[])

    const fetchUsersCount = async()=>{
        const response = await request({
        method: requestMethods.GET,
        route:'/api/v0.1/statistics/users' 
        });
        if(response.success){
        dispatch(storeUsersCount({totalUsers:response.data}))
        }
    }
    const fetchDietitiansAndTrainers = async()=>{
        const response = await request({
        method: requestMethods.GET,
        route:'/api/v0.1/statistics/users/by-role' 
        });
        if(response.success){
        dispatch(storeDietitiansCount({dietitians:response.data.dietitians}))
        dispatch(storeTrainersCount({trainers:response.data.trainers}))
        // dispatch(storeExercicesCount({exercices:response.data}))
        }
    }
    const fetchExercices = async()=>{
        const response = await request({
        method: requestMethods.GET,
        route:'/api/v0.1/statistics/user-exercices' 
        });
        console.log(response)
        if(response.success){
        
        dispatch(storeExercicesCount({exercices:response.data}))
        dispatch(setLoading({loading:false}))
        }
    }


    const fetchLeaderboard = async()=>{
        const response = await request({
        method: requestMethods.GET,
        route:'/api/v0.1/statistics/leaderboard' 
        });
        console.log(response)
        if(response.success){
        
        dispatch(setLeaderboard({leaderboard:response.data}))
        dispatch(setChartsLoading({chartsLoading:false}))
        }
    }
    
    


    const totalUsers = StatisticsState.totalUsers
    const totalTrainers = StatisticsState.trainers
    const totalDietitians = StatisticsState.dietitians
    const totalExercices = StatisticsState.exercices
        
    const leaderboard = ChartsState.leaderboard
    const chartsLoading = ChartsState.loading

  return {
    totalUsers,
    totalDietitians,
    totalTrainers,
    totalExercices,
    leaderboard,
    chartsLoading
  }
}

export default OverviewLogic
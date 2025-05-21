import React, { useEffect } from 'react'
import InfoTiles from '../components/InfoTiles'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faBowlFood,  faDumbbell, faPersonChalkboard, faUser } from '@fortawesome/free-solid-svg-icons';
import TableRow from '../components/TableRow';
import BasicBarChart from '../components/BarChart';
import CustomLineChart from '../components/CustomLineChart';
import CustomPieChart from '../components/PieChart';
import { useDispatch, useSelector } from 'react-redux';
import StatisticsSlice, { setLoading, storeDietitiansCount, storeUsersCount,storeTrainersCount ,storeExercicesCount} from '../../../../core/redux/Statistics/slice';
import request from '../../../../lib/remote/axios';
import requestMethods from '../../../../lib/enums/request.methods'

const Overview = () => {


    const dispatch = useDispatch()
    const StatisticsState = useSelector((global)=>global.Statistics)
    useEffect(()=>{
       
        fetchUsersCount();
        fetchDietitiansAndTrainers();
        fetchExercices()
        
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
    
    const totalUsers = StatisticsState.totalUsers
    const totalTrainers = StatisticsState.trainers
    const totalDietitians = StatisticsState.dietitians
    const totalExercices = StatisticsState.exercices
        


  return (
    <div className=' w-3/4 h-[90%] m-auto flex flex-col gap-6 '>
        {/* //split horizontal */}
        <div className=' flex-1 flex gap-3'>
            <div className=' w-1/3 flex flex-col gap-3'>
                <div id='upper-tiles' className=' flex-1 flex gap-2'>
                    <InfoTiles icon={faUser} title='Total users' count={totalUsers}/>
                    <InfoTiles icon={faBowlFood} title='Dietitians' count={totalDietitians}/>
                    
                </div>
                <div id='lower-tiles ' className=' flex-1 flex gap-2'>
                    <InfoTiles icon={faPersonChalkboard} title='Trainers' count={totalTrainers}/>
                    <InfoTiles icon={faDumbbell} title='user' count={totalExercices}/>
                </div>
            </div>
            <div className='bg-white w-2/3 flex flex-col items-center justify-between'>
                <h3 className='pt-4'>Users growth</h3>
                <CustomLineChart data={ [{ name: 'Jan', value: 400 },
                { name: 'Feb', value: 300 },
                { name: 'Mar', value: 600 },
                { name: 'Apr', value: 800 },
                { name: 'May', value: 500 },
                { name: 'Jun', value: 900 },
                { name: 'Jul', value: 1000 }]}/>
            </div>
        </div>

        <div className=' flex-1 flex gap-3'>

            <div className='bg-tertiary flex-1 flex flex-col rounded-2xl pt-4'>
                <div className='flex w-full text-dark_grey'>
                    <h3 className='flex-1 pl-4'>NAME</h3> 
                    <div className='flex-1 flex w-full justify-between pr-4 text-center' ><h3 className='flex-1'>STREAK</h3> <h3 className='flex-1'>POINTS</h3></div>
                    </div>
                <TableRow image='https://www.cameo.com/cdn-cgi/image/fit=cover,format=auto,width=210,height=278/https://cdn.cameo.com/thumbnails/648e2bf7c2977ff5614bc426-wm-thumbnail.jpg' name='john doe' streak={50} points={800}/>
                <TableRow image='https://www.cameo.com/cdn-cgi/image/fit=cover,format=auto,width=210,height=278/https://cdn.cameo.com/thumbnails/648e2bf7c2977ff5614bc426-wm-thumbnail.jpg' name='john doe' streak={50} points={800}/>
                <TableRow image='https://www.cameo.com/cdn-cgi/image/fit=cover,format=auto,width=210,height=278/https://cdn.cameo.com/thumbnails/648e2bf7c2977ff5614bc426-wm-thumbnail.jpg' name='john doe' streak={50} points={800}/>
                <TableRow image='https://www.cameo.com/cdn-cgi/image/fit=cover,format=auto,width=210,height=278/https://cdn.cameo.com/thumbnails/648e2bf7c2977ff5614bc426-wm-thumbnail.jpg' name='john doe' streak={50} points={800}/>
            </div>

            {/* most used exercices */}
            <div className='bg-white flex-1 flex flex-col items-center justify-between'>
                <h3 className='pt-4'>Most used exercices</h3>
                <BasicBarChart data={ [
                { name: 'Jan', value: 400 },
                { name: 'Feb', value: 300 },
                { name: 'Mar', value: 600 },
                { name: 'Apr', value: 800 },
                ]}/>
            </div>
            <div className='bg-white flex-1 flex flex-col items-center justify-between'>
                <h3 className='pt-4'>Users growth</h3>
                {/* geography */}
                <CustomPieChart data={[
                { name: 'Squats', value: 35 },
                { name: 'Push-ups', value: 25 },
                { name: 'Deadlifts', value: 20 },
                { name: 'Pull-ups', value: 15 },
                { name: 'Lunges', value: 5 },
                ]}/>
            </div>
        </div>
    </div>
  )
}

export default Overview
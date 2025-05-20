import { BrowserRouter,Routes,Route } from 'react-router-dom'; 
import Navbar from './components/Navbar'
import './App.css'
import Sidebar from './components/Sidebar';
import Overview from './features/statistics/pages/Overview';

function App() {
  

  return (
   
    <div className="flex flex-col h-screen">
      <Navbar></Navbar>

      <div id='horizontal-section' className=' flex h-full'>

        <Sidebar/>

        <BrowserRouter>
          <Routes>
            <Route path='/' element={<Overview/>}/>
            <Route path='/statistics' element={<h1>stats screen</h1>}/>
          </Routes>
      </BrowserRouter>
      </div>

      

    </div>
    
  )
}

export default App

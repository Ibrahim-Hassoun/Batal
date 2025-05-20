import { BrowserRouter,Routes,Route } from 'react-router-dom'; 
import Navbar from './components/Navbar'
import './App.css'
import Sidebar from './components/Sidebar';

function App() {
  

  return (
   
    <div className="flex flex-col h-screen">
      <Navbar></Navbar>

      <div id='horizontal-section' className=' flex h-full'>

        <Sidebar/>

        <BrowserRouter>
          <Routes>
            <Route path='/' element={<h1>home screen</h1>}/>
            <Route path='/stats' element={<h1>stats screen</h1>}/>
          </Routes>
      </BrowserRouter>
      </div>

      

    </div>
    
  )
}

export default App

import React, { Component } from 'react';

import SingleSeenMovie from './SingleSeenMovie.jsx'

import Auth from '../modules/Auth';

import axios from 'axios';

class SeenMovies extends Component {
    constructor() {
        super();
        this.state = {
            userMovieData: '',
            userMovieDataLoaded: false,
        }
    }

    componentDidMount() {
        axios('/movies', {
            method: 'GET',
            headers: {
                'Authorization': `Token ${Auth.getToken()}`,
                token: Auth.getToken(),
            }
        }).then(res => {
            console.log(res.data.movies)
            this.setState({
                userMovieData: res.data.movies,
                userMovieDataLoaded: true,
            })
        })
    }

    renderSeenMoviesList = () => {
        if(this.state.userMovieDataLoaded) {
            return this.state.userMovieData.map(seenMovie => {
               return ( 
                <SingleSeenMovie key={seenMovie.id} 
                    seenMovie={seenMovie}
                    userMovieData={this.state.userMovieData}
                    userMovieDataLoaded={this.state.userMovieDataLoaded}
                    posterResults={this.props.posterResults}
                    handleSingleMovie={this.props.handleSingleMovie}/>
               )     
            })
        }
    }

    render() {
        return (
            <div className='seen-movies-container'>
                <h1>You've Seen All These Movies!</h1>
                 {this.renderSeenMoviesList()}
            </div>    
        )
    }
}

export default SeenMovies;
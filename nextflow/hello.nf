#!/usr/bin/env nextflow     

params.greeting  = 'Hello World!' 
greeting_ch = Channel.of(params.greeting) 

process SPLITLETTERS { 
    input: 
    val x 

    output: 
    path 'chunk_*' 

    """ 
    printf '$x' | split -b 6 - chunk_  
    """ 
} 

process CONVERTTOUPPER { 
    input:  
    path y 

    output: 
    stdout 

    """ 
    cat $y | tr '[a-z]' '[A-Z]'  
    """ 
} 

workflow { 
    letters_ch = SPLITLETTERS(greeting_ch) 
    results_ch = CONVERTTOUPPER(letters_ch.flatten()) 
    results_ch.view{ it } 
} 

<?php
/**
 * CATS
 * Document to Text Conversion Library
 *
 * Copyright (C) 2005 - 2007 Cognizo Technologies, Inc.
 *
 *
 * The contents of this file are subject to the CATS Public License
 * Version 1.1a (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://www.catsone.com/.
 *
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
 * License for the specific language governing rights and limitations
 * under the License.
 *
 * The Original Code is "CATS Standard Edition".
 *
 * The Initial Developer of the Original Code is Cognizo Technologies, Inc.
 * Portions created by the Initial Developer are Copyright (C) 2005 - 2007
 * (or from the year in which this file was created to the year 2007) by
 * Cognizo Technologies, Inc. All Rights Reserved.
 *
 *
 * @package    CATS
 * @subpackage Library
 * @copyright Copyright (C) 2005 - 2007 Cognizo Technologies, Inc.
 * @version    $Id: DocumentToText.php 3587 2007-11-13 03:55:57Z will $
 */

include_once('./lib/SystemUtility.php');
include_once('./lib/FileUtility.php');

/**
 *	Document to Text Conversion Library
 *	@package    CATS
 *	@subpackage Library
 */
class DocumentToText
{
    private $_linesArray = array();
    private $_linesString = '';
    private $_rawOutput = '';
    private $_fileName = '';
    private $_returnCode = -1;
    private $_isError = false;
    private $_error = '';


    /**
     * Returns a document type based on its file extension and content type.
     * This is simply a wrapper for FileUtility::getDocumentType().
     *
     * @param string Document file name with extension.
     * @param string MIME content type.
     * @return flag Document type flag.
     */
    public function getDocumentType($fileName, $contentType = false)
    {
        return FileUtility::getDocumentType($fileName, $contentType);
    }

    /**
     * Attempts to convert a document document to plain text.
     *
     * @param string file name
     * @param flag document type
     * @return boolean True if successful; false otherwise.ful
     */
    private function read_doc($fileName)	{
		$fileHandle = fopen($fileName, "r");
		$line = @fread($fileHandle, filesize($fileName));   
		$lines = explode(chr(0x0D),$line);
		$outtext = "";
		foreach($lines as $thisline)
		  {
			$pos = strpos($thisline, chr(0x00));
			if (($pos !== FALSE)||(strlen($thisline)==0))
			  {
			  } else {
				$outtext .= $thisline." ";
			  }
		  }
		 $outtext = preg_replace("/[^a-zA-Z0-9\s\,\.\-\n\r\t@\/\_\(\)]/","",$outtext);
		return $outtext;
	}
	
	 public  function decodeAsciiHex($input) {
    $output = "";

    $isOdd = true;
    $isComment = false;

    for($i = 0, $codeHigh = -1; $i < strlen($input) && $input[$i] != '>'; $i++) {
        $c = $input[$i];

        if($isComment) {
            if ($c == '\r' || $c == '\n')
                $isComment = false;
            continue;
        }

        switch($c) {
            case '\0': case '\t': case '\r': case '\f': case '\n': case ' ': break;
            case '%': 
                $isComment = true;
            break;

            default:
                $code = hexdec($c);
                if($code === 0 && $c != '0')
                    return "";

                if($isOdd)
                    $codeHigh = $code;
                else
                    $output .= chr($codeHigh * 16 + $code);

                $isOdd = !$isOdd;
            break;
        }
    }

    if($input[$i] != '>')
        return "";

    if($isOdd)
        $output .= chr($codeHigh * 16);

    return $output;
}
public  function decodeAscii85($input) {
    $output = "";

    $isComment = false;
    $ords = array();
    
    for($i = 0, $state = 0; $i < strlen($input) && $input[$i] != '~'; $i++) {
        $c = $input[$i];

        if($isComment) {
            if ($c == '\r' || $c == '\n')
                $isComment = false;
            continue;
        }

        if ($c == '\0' || $c == '\t' || $c == '\r' || $c == '\f' || $c == '\n' || $c == ' ')
            continue;
        if ($c == '%') {
            $isComment = true;
            continue;
        }
        if ($c == 'z' && $state === 0) {
            $output .= str_repeat(chr(0), 4);
            continue;
        }
        if ($c < '!' || $c > 'u')
            return "";

        $code = ord($input[$i]) & 0xff;
        $ords[$state++] = $code - ord('!');

        if ($state == 5) {
            $state = 0;
            for ($sum = 0, $j = 0; $j < 5; $j++)
                $sum = $sum * 85 + $ords[$j];
            for ($j = 3; $j >= 0; $j--)
                $output .= chr($sum >> ($j * 8));
        }
    }
    if ($state === 1)
        return "";
    elseif ($state > 1) {
        for ($i = 0, $sum = 0; $i < $state; $i++)
            $sum += ($ords[$i] + ($i == $state - 1)) * pow(85, 4 - $i);
        for ($i = 0; $i < $state - 1; $i++)
            $ouput .= chr($sum >> ((3 - $i) * 8));
    }

    return $output;
}
	 public  function decodeFlate($input) {
    return @gzuncompress($input);
}

public  function getObjectOptions($object) {
    $options = array();
    if (preg_match("#<<(.*)>>#ismU", $object, $options)) {
        $options = explode("/", $options[1]);
        @array_shift($options);

        $o = array();
        for ($j = 0; $j < @count($options); $j++) {
            $options[$j] = preg_replace("#\s+#", " ", trim($options[$j]));
            if (strpos($options[$j], " ") !== false) {
                $parts = explode(" ", $options[$j]);
                $o[$parts[0]] = $parts[1];
            } else
                $o[$options[$j]] = true;
        }
        $options = $o;
        unset($o);
    }

    return $options;
}

public  function getDecodedStream($stream, $options) {
    $data = "";
    if (empty($options["Filter"]))
        $data = $stream;
    else {
        $length = !empty($options["Length"]) ? $options["Length"] : strlen($stream);
        $_stream = substr($stream, 0, $length);

        foreach ($options as $key => $value) {
            if ($key == "ASCIIHexDecode")
                $_stream = $this->decodeAsciiHex($_stream);
            if ($key == "ASCII85Decode")
                $_stream = $this->decodeAscii85($_stream);
            if ($key == "FlateDecode")
                $_stream = $this->decodeFlate($_stream);
        }
        $data = $_stream;
    }
    return $data;
}

public  function getDirtyTexts(&$texts, $textContainers) {
    for ($j = 0; $j < count($textContainers); $j++) {
        if (preg_match_all("#\[(.*)\]\s*TJ#ismU", $textContainers[$j], $parts))
            $texts = array_merge($texts, @$parts[1]);
        elseif(preg_match_all("#Td\s*(\(.*\))\s*Tj#ismU", $textContainers[$j], $parts))
            $texts = array_merge($texts, @$parts[1]);
    }
}

public  function getCharTransformations(&$transformations, $stream) {
    preg_match_all("#([0-9]+)\s+beginbfchar(.*)endbfchar#ismU", $stream, $chars, PREG_SET_ORDER);
    preg_match_all("#([0-9]+)\s+beginbfrange(.*)endbfrange#ismU", $stream, $ranges, PREG_SET_ORDER);

    for ($j = 0; $j < count($chars); $j++) {
        $count = $chars[$j][1];
        $current = explode("\n", trim($chars[$j][2]));
        for ($k = 0; $k < $count && $k < count($current); $k++) {
            if (preg_match("#<([0-9a-f]{2,4})>\s+<([0-9a-f]{4,512})>#is", trim($current[$k]), $map))
                $transformations[str_pad($map[1], 4, "0")] = $map[2];
        }
    }
    for ($j = 0; $j < count($ranges); $j++) {
        $count = $ranges[$j][1];
        $current = explode("\n", trim($ranges[$j][2]));
        for ($k = 0; $k < $count && $k < count($current); $k++) {
            if (preg_match("#<([0-9a-f]{4})>\s+<([0-9a-f]{4})>\s+<([0-9a-f]{4})>#is", trim($current[$k]), $map)) {
                $from = hexdec($map[1]);
                $to = hexdec($map[2]);
                $_from = hexdec($map[3]);

                for ($m = $from, $n = 0; $m <= $to; $m++, $n++)
                    $transformations[sprintf("%04X", $m)] = sprintf("%04X", $_from + $n);
            } elseif (preg_match("#<([0-9a-f]{4})>\s+<([0-9a-f]{4})>\s+\[(.*)\]#ismU", trim($current[$k]), $map)) {
                $from = hexdec($map[1]);
                $to = hexdec($map[2]);
                $parts = preg_split("#\s+#", trim($map[3]));
                
                for ($m = $from, $n = 0; $m <= $to && $n < count($parts); $m++, $n++)
                    $transformations[sprintf("%04X", $m)] = sprintf("%04X", hexdec($parts[$n]));
            }
        }
    }
}

public  function getTextUsingTransformations($texts, $transformations) {
    $document = "";
    for ($i = 0; $i < count($texts); $i++) {
        $isHex = false;
        $isPlain = false;

        $hex = "";
        $plain = "";
        for ($j = 0; $j < strlen($texts[$i]); $j++) {
            $c = $texts[$i][$j];
            switch($c) {
                case "<":
                    $hex = "";
                    $isHex = true;
                break;
                case ">":
                    $hexs = str_split($hex, 4);
                    for ($k = 0; $k < count($hexs); $k++) {
                        $chex = str_pad($hexs[$k], 4, "0");
                        if (isset($transformations[$chex]))
                            $chex = $transformations[$chex];
                        $document .= html_entity_decode("&#x".$chex.";");
                    }
                    $isHex = false;
                break;
                case "(":
                    $plain = "";
                    $isPlain = true;
                break;
                case ")":
                    $document .= $plain;
                    $isPlain = false;
                break;
                case "\\":
                    $c2 = $texts[$i][$j + 1];
                    if (in_array($c2, array("\\", "(", ")"))) $plain .= $c2;
                    elseif ($c2 == "n") $plain .= '\n';
                    elseif ($c2 == "r") $plain .= '\r';
                    elseif ($c2 == "t") $plain .= '\t';
                    elseif ($c2 == "b") $plain .= '\b';
                    elseif ($c2 == "f") $plain .= '\f';
                    elseif ($c2 >= '0' && $c2 <= '9') {
                        $oct = preg_replace("#[^0-9]#", "", substr($texts[$i], $j + 1, 3));
                        $j += strlen($oct) - 1;
                        $plain .= html_entity_decode("&#".octdec($oct).";");
                    }
                    $j++;
                break;

                default:
                    if ($isHex)
                        $hex .= $c;
                    if ($isPlain)
                        $plain .= $c;
                break;
            }
        }
        $document .= "\n";
    }

    return $document;
}


public  function pdf2text($filename) {
    $infile = @file_get_contents($filename, FILE_BINARY);
    if (empty($infile))
        return "";

    $transformations = array();
    $texts = array();

    preg_match_all("#obj(.*)endobj#ismU", $infile, $objects);
    $objects = @$objects[1];

    for ($i = 0; $i < count($objects); $i++) {
        $currentObject = $objects[$i];

        if (preg_match("#stream(.*)endstream#ismU", $currentObject, $stream)) {
            $stream = ltrim($stream[1]);

            $options = $this->getObjectOptions($currentObject);
            if (!(empty($options["Length1"]) && empty($options["Type"]) && empty($options["Subtype"])))
                continue;

            $data = $this->getDecodedStream($stream, $options); 
            if (strlen($data)) {
                if (preg_match_all("#BT(.*)ET#ismU", $data, $textContainers)) {
                    $textContainers = @$textContainers[1];
                    $this->getDirtyTexts($texts, $textContainers);
                } else
                    $this->getCharTransformations($transformations, $data);
            }
        }
    }

    return $this->getTextUsingTransformations($texts, $transformations);
}
	
	
	
	 
public  function read_doc_file($filename) {
		     if(file_exists($filename))
		    {
		        if(($fh = fopen($filename, 'r')) !== false ) 
		        {
		           $headers = fread($fh, 0xA00);

		           // 1 = (ord(n)*1) ; Document has from 0 to 255 characters
		           $n1 = ( ord($headers[0x21C]) - 1 );

		           // 1 = ((ord(n)-8)*256) ; Document has from 256 to 63743 characters
		           $n2 = ( ( ord($headers[0x21D]) - 8 ) * 256 );

		           // 1 = ((ord(n)*256)*256) ; Document has from 63744 to 16775423 characters
		           $n3 = ( ( ord($headers[0x21E]) * 256 ) * 256 );

		           // 1 = (((ord(n)*256)*256)*256) ; Document has from 16775424 to 4294965504 characters
		           $n4 = ( ( ( ord($headers[0x21F]) * 256 ) * 256 ) * 256 );

		           // Total length of text in the document
		           $textLength = ($n1 + $n2 + $n3 + $n4);

		           $extracted_plaintext = fread($fh, $textLength);

		           // simple print character stream without new lines
		           //echo $extracted_plaintext;

		           // if you want to see your paragraphs in a new line, do this
		           return $extracted_plaintext;
		           // need more spacing after each paragraph use another nl2br
		        }
		    }   
    }

public function convert($fileName, $documentType)
    {
        /* (Re?)initialize variables. */
        $this->_linesArray  = array();
        $this->_linesString = '';
        $this->_rawOutput   = '';
        $this->_fileName    = $fileName;

        /* If we are trying to parse a DOC file, is it really a DOC file or is
         * it an RTF file?
         */
        if ($documentType == DOCUMENT_TYPE_DOC)
        {
            $handle = @fopen(realpath($fileName), 'r');
            if ($handle)
            {
                $header = fread($handle, 5);
                fclose($handle);
                
                if ($header == '{\rtf')
                {
                    $documentType = DOCUMENT_TYPE_RTF;
                }
            }
        }
        
        /* Find the absolute path to the filename and escape it for use in a
         * system command.
         */
        $escapedFilename = escapeshellarg(realpath($fileName));

        /* Use different methods to extract text depending on the type of document. */
        switch ($documentType)
        {
            case DOCUMENT_TYPE_DOC:
                if (ANTIWORD_PATH == '')
                {
                    $this->_setError('The DOC format has not been configured.');
                    return false;
                }

                $nativeEncoding = 'UTF-8';
                $command = '"'. ANTIWORD_PATH . '" -m ' . ANTIWORD_MAP . ' '
                    . $escapedFilename;
               $this->_returnCode = ($this->_rawOutput = $this->read_doc_file($fileName)) ? 1 : 0;
               $this->_linesString = $this->_rawOutput;

                return true;
                break;

            case DOCUMENT_TYPE_PDF:
                if (PDFTOTEXT_PATH == '')
                {
                    $this->_setError('The PDF format has not been configured.');
                    return false;
                }

                $nativeEncoding = 'ISO-8859-1';
                $convertEncoding = false;
                $command = '"'. PDFTOTEXT_PATH . '" -layout ' . $escapedFilename . ' -';
                $this->_returnCode = ($this->_rawOutput = $this->pdf2text($fileName)) ? 1 : 0;
                $this->_linesString = $this->_rawOutput;

                return true;
                
                break;

            case DOCUMENT_TYPE_HTML:
                if (HTML2TEXT_PATH == '')
                {
                    $this->_setError('The HTML format has not been configured.');
                    return false;
                }

                $nativeEncoding = 'ISO-8859-1';
                $convertEncoding = false;
                
                if (SystemUtility::isWindows())
                {
                    $command = 'TYPE ' . $escapedFilename . ' | "'. HTML2TEXT_PATH . '" -nobs ';
                }
                else
                {
                    $command = '"'. HTML2TEXT_PATH . '" -nobs ' . $escapedFilename;
                }                
                break;

            case DOCUMENT_TYPE_TEXT:
                return $this->_readTextFile($fileName);
                break;

            case DOCUMENT_TYPE_RTF;
                 /* Store the output in string and array form. */
                $this->_returnCode = ($this->_rawOutput = $this->rtf2text($fileName)) ? 1 : 0;

                /* If command returned non-zero or output is not an array, assume
                 * failure.
                 */
                if ($commandResult['returnCode'] != 0)
                {
                    return false;
                }
                $this->_linesArray = array($commandResult['output']);
                $this->_linesString = $this->_rawOutput;

                return true;                break;

            case DOCUMENT_TYPE_ODT:
                 /* Store the output in string and array form. */
                $this->_returnCode = ($this->_rawOutput = $this->odt2text($fileName)) ? 1 : 0;

                /* If command returned non-zero or output is not an array, assume
                 * failure.
                 */
                if ($commandResult['returnCode'] != 0)
                {
                    return false;
                }
                $this->_linesArray = array($commandResult['output']);
                $this->_linesString = $this->_rawOutput;

                return true;
                break;

            case DOCUMENT_TYPE_DOCX:
                /* Store the output in string and array form. */
                $this->_returnCode = ($this->_rawOutput = $this->docx2text($fileName)) ? 1 : 0;

                /* If command returned non-zero or output is not an array, assume
                 * failure.
                 */
                if ($commandResult['returnCode'] != 0)
                {
                    return false;
                }
                $this->_linesArray = array($commandResult['output']);
                $this->_linesString = $this->_rawOutput;

                return true;
                break;

            case DOCUMENT_TYPE_UNKNOWN:
            default:
                $this->_setError('This file format is unknown format and is not yet supported by CATS.');
                return false;
                break;
        }

        /* Run the text converter. */
        $commandResult = $this->_executeCommand($command);

        /* Store the return code for getReturnCode(). */
        $this->_returnCode = $commandResult['returnCode'];

        /* Store the raw output for getRawOutput(). */
        
        $commandResult['output'] = array_map(
            'rtrim', $commandResult['output']
        );
        $this->_rawOutput = implode("\n", $commandResult['output']);

        /* Fix encoding issues. */
        if ($nativeEncoding == 'ISO-8859-1' && function_exists('iconv'))
        {   
            $this->_rawOutput = iconv(
                $nativeEncoding, 'UTF-8', $this->_rawOutput
            );
        }

        /* If command returned non-zero or output is not an array, assume
         * failure.
         */
        if ($commandResult['returnCode'] != 0 ||
            !is_array($commandResult['output']))
        {
            return false;
        }

        /* Store the output in string and array form. */
        $this->_linesArray  = $commandResult['output'];
        $this->_linesString = $this->_rawOutput;

        return true;
    }

    /**
     * Returns the word document in plain-text format. Make sure to check
     * the return value of the convert() method to make sure conversion was
     * actually preformed.
     *
     * @return string document in plain-text
     */
    public function getString()
    {
        return $this->_linesString;
    }

    /**
     * Returns the word document in plain-text format as an array of line
     * number => line. Make sure to check the return value of the convert()
     * method to make sure conversion was actually preformed.
     *
     * @return array document lines
     */
    public function getArray()
    {
        return $this->_linesArray;
    }

    /**
     * Returns the return code from the execution of the document converter for
     * the last conversion. This is useful for error handling / debugging.
     *
     * @return integer converter return code
     */
    public function getReturnCode()
    {
        return $this->_returnCode;
    }

    /**
     * Returns a string containing the raw output from the document converter
     * for the last conversion. This is useful for error handling / debugging.
     *
     * @return string raw converter output
     */
    public function getRawOutput()
    {
        return $this->_rawOutput;
    }

    /**
     * Returns true if an error occurred trying to convert the document.
     *
     * @return boolean error occurred
     */
    public function isError()
    {
        return $this->_isError;
    }

    /**
     * Returns the current error message, or '' if no errors have occurred.
     *
     * @return string error message
     */
    public function getError()
    {
        return $this->_error;
    }


    /**
     * Triggers an error message.
     *
     * @param string error message
     * @param integer converter return code
     * @return void
     */
    private function _setError($errorMessage, $returnCode = 1)
    {
        $this->_rawOutput = '';
        $this->_linesArray  = array();
        $this->_linesString = '';
        $this->_returnCode = $returnCode;
        $this->_isError = true;
        $this->_error = $errorMessage;
    }

    /**
     * Loads a text file as if it was "converted" to text.
     *
     * @param string path to text file
     * @return boolean True if successful; false otherwise.
     */
    private function _readTextFile($fileName)
    {
        $contents = @file($fileName);
        if ($contents === false || !is_array($contents))
        {
            $this->_setError('Failed to parse text file.');
            return false;
        }

        $contents = array_map('rtrim', $contents);
        
        $this->_rawOutput = implode("\n", $contents);
        $this->_linesArray  = $contents;
        $this->_linesString = $this->_rawOutput;
        $this->_returnCode = 0;
        return true;
    }

    /**
     * Executes a shell command in a platform-independent way and returns the
     * results in an array containing the exact system command executed, the
     * raw output of that command, and the command's return code.
     *
     * @param string command to execute
     * @return array command results
     */
    private function _executeCommand($command)
    {
        /* Running on Windows? */
        if (SystemUtility::isWindows())
        {
            /* Generate a random temp file name. */
            $tempFile = sprintf(
                '%s/%s.txt',
                realpath(CATS_TEMP_DIR),
                FileUtility::makeRandomFilename()
            );

            /* Create a new COM Windows Scripting Host Shell object. */
            $WSHShell = new COM('WScript.Shell');

            /* Build the command to execute. */
            $command = sprintf(
                'cmd.exe /C "%s > "%s""', $command, $tempFile
            );

            /* Execute the command via the Windows Scripting Host Shell. */
            $returnCode = $WSHShell->Run($command, 0, true);

            /* Grab the contents of the temporary file and remove it. */
            $output = file($tempFile);
            @unlink($tempFile);
        }
        else
        {
            @exec($command, $output, $returnCode);
        }

        return array(
            'command'    => $command,
            'output'     => $output,
            'returnCode' => $returnCode
        );
    }

    private function odt2text($filename)
    {
        return $this->readZippedXML($filename, "content.xml");
    }

    private function docx2text($filename)
    {
        return $this->readZippedXML($filename, "word/document.xml");
    }

    private function readZippedXML($archiveFile, $dataFile)
    { //error_reporting(-1);
        // Create new ZIP archive
        $zip = new ZipArchive;

        // Open received archive file
        if (true === $zip->open($archiveFile))
        {
            // If done, search for the data file in the archive
            if (($index = $zip->locateName($dataFile)) !== false)
            {
                // If found, read it to the string
                $data = $zip->getFromIndex($index);
                // Close archive file
                $zip->close();
                // Load XML from a string
                // Skip errors and warnings
                $xml = DOMDocument::loadXML($data, LIBXML_NOENT | LIBXML_XINCLUDE | LIBXML_NOERROR | LIBXML_NOWARNING);
                $raw_text = $xml->saveXML();
                // We need to add a space where end-of-line and end-of-paragraphs present 
                $raw_text_patched = str_replace(
                        array('<w:br/>', '</w:p>', '<text:line-break', '<text:p'),
                        array("\n<w:br/>", "\n</w:p>", "\n<text:line-break", "\n<text:p"), $raw_text);
                // Return data without XML formatting tags
                return strip_tags($raw_text_patched);
            }
            $zip->close();
        }

        // In case of failure return empty string
        return "";
    }

    private function rtf2text($filename)
    {
        global $text;
        global $j;
        global $len;
        $text = file_get_contents($filename);

        // we'll try to fix up the parts of the rtf as best we can
        // clean up the file a little to simplify parsing
        $text = str_replace("\r", ' ', $text); // returns
        $text = str_replace("\n", ' ', $text); // new lines
        $text = str_replace('  ', ' ', $text); // double spaces
        $text = str_replace('  ', ' ', $text); // double spaces
        $text = str_replace('  ', ' ', $text); // double spaces
        $text = str_replace('  ', ' ', $text); // double spaces
        $text = str_replace('} {', '}{', $text); // embedded spaces
        // skip over the heading stuff
        $j = strpos($text, '{', 1); // skip ahead to the first part of the header

        $loc = 1;
        $t = "";

        $ansa = "";
        $len = strlen($text);
        $this->getpgraph(); // skip by the first paragrap

        while ($j < $len)
        {
            $c = substr($text, $j, 1);
            if ($c == "\\")
            {
                // have a tag
                $tag = $this->gettag();
                if (strlen($tag) > 0)
                {
                    // process known tags
                    switch ($tag)
                    {
                        case 'par':
                            $ansa.="\r\n";
                            break;
                        // ad a list of common tags
                        // parameter tags
                        case 'spriority1':
                        case 'fprq2':
                        case 'author':
                        case 'operator':
                        case 'sqformat':
                        case 'company':
                        case 'xmlns1':
                        case 'wgrffmtfilter':
                        case 'pnhang':
                        case 'themedata':
                        case 'colorschememapping':
                            $tt = $this->gettag();
                            break;
                        case '*':
                        case 'info':
                        case 'stylesheet':
                            // gets to end of paragraph
                            $j--;
                            $this->getpgraph();
                        default:
                        // ignore the tag
                    }
                }
            }
            else
            {
                $ansa.=$c;
            }
            $j++;
        }
        $ansa = str_replace('{', '', $ansa);
        $ansa = str_replace('}', '', $ansa);
        return $ansa;
    }

    private function getpgraph()
    {
        // if the first char after a tag is { then throw out the entire paragraph
        // this has to be nested
        global $text;
        global $j;
        global $len;
        $nest = 0;
        while (true)
        {
            $j++;
            if ($j >= $len)
                break;
            if (substr($text, $j, 1) == '}')
            {
                if ($nest == 0)
                    return;
                $nest--;
            }
            if (substr($text, $j, 1) == '{')
            {
                $nest++;
            }
        }
        return;
    }

    private function gettag()
    {
        // gets the text following the / character or gets the param if it there
        global $text;
        global $j;
        global $len;
        $tag = '';
        while (true)
        {
            $j++;
            if ($j >= $len)
                break;
            $c = substr($text, $j, 1);
            if ($c == ' ')
                break;
            if ($c == ';')
                break;
            if ($c == '}')
                break;
            if ($c == "\\")
            {
                $j--;
                break;
            }
            if ($c == "{")
            {
                //getpgraph();
                break;
            }
            if ((($c >= '0') && ($c <= '9')) || (($c >= 'a') && ($c <= 'z')) || (($c >= 'A') && ($c <= 'Z')) || $c == "'" || $c == "-" || $c == "*") {
                $tag = $tag . $c;
            } else {
                // end of tag
                $j--;
                break;
            }
        }
        return $tag;
    }

}
?>
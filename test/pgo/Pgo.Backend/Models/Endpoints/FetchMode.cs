namespace Pgo.Backend.Models.Endpoints;

public enum FetchMode
{
	DicomOrginal,   // A download of the image data from DICOMweb multipart message, file extracted. Usually a DCM.
	DicomRendered,  // A rendered image from DICOMweb server, if server supports. Usually a JPEG or PNG.
    DicomRenderedBase64,   // A rendered image from DICOMweb server, if server supports. Base64 encoded bytes.
    DicomStream,    // A stream of the image data from DICOMweb multipart message with content-disposition to open viewer. Usually a DCM.
	WebDirect,      // A direct http fetch of the image from url, content disposition file.
    WebDirectBase64 // A direct http fetch of the image from url. Base64 encoded bytes.
}
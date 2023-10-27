package FactoryRequest;

public class FactoryRequest {
    public static IRequest make(String type){
        return switch (type.toLowerCase()) {
            case "post" -> new RequestPOST();
            case "put" -> new RequestPUT();
            case "delete" -> new RequestDELETE();
            default -> new RequestGET();
        };
    }
}
